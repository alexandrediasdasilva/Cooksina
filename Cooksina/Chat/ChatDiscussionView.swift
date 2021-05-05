//
//  ChatDiscussionView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct ChatDiscussionView: View {
    let discussion:ChatList
    
    var body: some View {
        VStack {
            Image(discussion.image)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        Text("\(discussion.name)")
            Divider()
    
            Chat()
            
            Spacer()

        }
    }
}

struct ChatDiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDiscussionView(discussion:ChatList(name: "Alex", image: "1", messagePreview: "coucou"))
    }
}

enum BubblePosition {
    case left
    case right
}

class ChatModel: ObservableObject {
    var text = "Message"
    @Published var arrayOfMessages : [String] = []
    @Published var arrayOfPositions : [BubblePosition] = []
    @Published var position = BubblePosition.right
}

struct ChatBubble<Content>: View where Content: View {
    let position: BubblePosition
    let color : Color
    let content: () -> Content
    init(position: BubblePosition, color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.color = color
        self.position = position
    }
    
    var body: some View {
        HStack(spacing: 0 ) {
            content()
                .padding(.all, 15)
                .foregroundColor(position == .left ? Color.white : Color.black)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .foregroundColor(color)
                        .rotationEffect(Angle(degrees: position == .left ? -50 : -130))
                        .offset(x: position == .left ? -5 : 5)
                    ,alignment: position == .left ? .bottomLeading : .bottomTrailing)
        }
        .padding(position == .left ? .leading : .trailing , 15)
        .padding(position == .right ? .leading : .trailing , 60)
        .frame(width: UIScreen.main.bounds.width, alignment: position == .left ? .leading : .trailing)
    }
}

struct CustomScrollView<Content>: View where Content: View {
    var axes: Axis.Set = .vertical
    var reversed: Bool = false
    var scrollToEnd: Bool = false
    var content: () -> Content

    @State private var contentHeight: CGFloat = .zero
    @State private var contentOffset: CGFloat = .zero
    @State private var scrollOffset: CGFloat = .zero

    var body: some View {
        GeometryReader { geometry in
            if self.axes == .vertical {
                self.vertical(geometry: geometry)
            } else {
                // implement same for horizontal orientation
            }
        }
        .clipped()
    }

    private func vertical(geometry: GeometryProxy) -> some View {
        VStack {
            content()
        }
        .modifier(ViewHeightKey())
        .onPreferenceChange(ViewHeightKey.self) {
            self.updateHeight(with: $0, outerHeight: geometry.size.height)
        }
        .frame(height: geometry.size.height, alignment: (reversed ? .bottom : .top))
        .offset(y: contentOffset + scrollOffset)
        .animation(.easeInOut)
        .background(Color.white)
        .gesture(DragGesture()
            .onChanged { self.onDragChanged($0) }
            .onEnded { self.onDragEnded($0, outerHeight: geometry.size.height) }
        )
    }

    private func onDragChanged(_ value: DragGesture.Value) {
        self.scrollOffset = value.location.y - value.startLocation.y
    }

    private func onDragEnded(_ value: DragGesture.Value, outerHeight: CGFloat) {
        let scrollOffset = value.predictedEndLocation.y - value.startLocation.y

        self.updateOffset(with: scrollOffset, outerHeight: outerHeight)
        self.scrollOffset = 0
    }

    private func updateHeight(with height: CGFloat, outerHeight: CGFloat) {
        let delta = self.contentHeight - height
        self.contentHeight = height
        if scrollToEnd {
            self.contentOffset = self.reversed ? height - outerHeight - delta : outerHeight - height
        }
        if abs(self.contentOffset) > .zero {
            self.updateOffset(with: delta, outerHeight: outerHeight)
        }
    }

    private func updateOffset(with delta: CGFloat, outerHeight: CGFloat) {
        let topLimit = self.contentHeight - outerHeight

        if topLimit < .zero {
             self.contentOffset = .zero
        } else {
            var proposedOffset = self.contentOffset + delta
            if (self.reversed ? proposedOffset : -proposedOffset) < .zero {
                proposedOffset = 0
            } else if (self.reversed ? proposedOffset : -proposedOffset) > topLimit {
                proposedOffset = (self.reversed ? topLimit : -topLimit)
            }
            self.contentOffset = proposedOffset
        }
    }
}



struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

extension ViewHeightKey: ViewModifier {
    func body(content: Content) -> some View {
        return content.background(GeometryReader { proxy in
            Color.clear.preference(key: Self.self, value: proxy.size.height)
        })
    }
}

struct Chat: View {
    @ObservedObject var model = ChatModel()
    @State private var iMessageColor : Color = Color("iMessageBorder")
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                //MARK:- ScrollView
                CustomScrollView(scrollToEnd: true) {
                    LazyVStack {
                        ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                            ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ?Color("bubbleBG1") : Color("bubbleBG3")) {
                                Text(model.arrayOfMessages[index])
                            }
                        }
                    }
                }.padding(.top)
                //MARK:- text editor
                /*HStack {
                    ZStack {
                        TextEditor(text: $model.text)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(.gray)
                    }.frame(height: 50)
                    
                    Button("send") {
                        if model.text != "" {
                            model.position = model.position == BubblePosition.right ? BubblePosition.left : BubblePosition.right
                            model.arrayOfPositions.append(model.position)
                            model.arrayOfMessages.append(model.text)
                            model.text = ""
                        }
                    }
                }.padding()*/
                Divider()
                
                HStack(spacing : 30) {
                    
                    HStack(spacing : 30){
                    Image("Raster-1").resizable().frame(width: 28.0, height: 22.0)
                }
                    
                    HStack(spacing: 10) {
                        
                        ZStack {
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color("iMessageBorder"), lineWidth: 1)
                            .foregroundColor(Color("iMessageBG"))
                            .frame(maxWidth: 300, maxHeight: 40)
                        
                        TextEditor(text: $model.text)
                             .frame(maxWidth: 140.0, maxHeight: 35.0)
                            .foregroundColor(iMessageColor)
                             .padding(.trailing, 30.0)
                             .onTapGesture {
                                model.text = ""
                                iMessageColor = Color(.black)
                                        }
                        
                        }
                        
                        Button("Envoyer") {
                            if model.text != "" {
                                model.position = model.position == BubblePosition.right ? BubblePosition.left : BubblePosition.right
                                model.arrayOfPositions.append(model.position)
                                model.arrayOfMessages.append(model.text)
                                model.text = ""
                            }
                        }
                    }
                    
     
                } .padding(.horizontal, 30)
                
                
            }
        }
    }
}
