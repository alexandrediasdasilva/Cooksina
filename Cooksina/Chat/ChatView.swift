//
//  ChatView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct ChatList: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var messagePreview: String
}

struct ChatView: View {
    
    @State private var selection: UUID?
    @State private var discussions = [
        ChatList(name: "Alex", image: "1", messagePreview: "Merci pour la recette !"),
        ChatList(name: "Sana", image: "2", messagePreview: "Coucou vous êtes là ?"),
        ChatList(name: "Hugo", image: "3", messagePreview: "Je viens de poster une recette"),
        ChatList(name: "Bodo", image: "4", messagePreview: "Qu'est-ce que tu prépares de bon ?"),
        ChatList(name: "Mondher", image: "5", messagePreview: "À plus tard :)"),
    ]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    
                        ForEach(discussions) { discussion in
                            NavigationLink(destination: ChatDiscussionView(discussion: discussion)) {
                                ChatListRow(myChatList: discussion)
                            }
                        }
                    
                    Spacer()
             
                } .navigationTitle("Chat")
            }
        }
    }
}



struct ChatListRow: View {
    
    let myChatList: ChatList
    
    var body: some View {

        HStack(alignment: .top, spacing: 20.0) {
            Image(myChatList.image)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(myChatList.name)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                
                Text(myChatList.messagePreview)
                    .foregroundColor(Color.gray)
                    .padding(.bottom)
                
                Divider()
                
            }
            Spacer()
        } .padding(.horizontal) .padding(.vertical, 10)
    }
}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
