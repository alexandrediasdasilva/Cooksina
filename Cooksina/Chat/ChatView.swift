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
        ChatList(name: "Alex", image: "1", messagePreview: "Merci pour la recette :)"),
        ChatList(name: "Sana", image: "2", messagePreview: "Coucou vous etes là ?"),
        ChatList(name: "Hugo", image: "3", messagePreview: "Je viens de poster une..."),
        ChatList(name: "Bodo", image: "4", messagePreview: "Que est ce que tu prépare..."),
        ChatList(name: "Mondher", image: "5", messagePreview: "A plus tard ... :D"),
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                List(discussions) { discussion in
                    NavigationLink(destination: ChatDiscussionView(discussion: discussion)) {
                        ChatListRow(myChatList: discussion) //, selectedItem: $selection
                    }
                }
            }.navigationTitle("Chat")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct ChatListRow: View {
    
    let myChatList: ChatList
    //@Binding var selectedItem: UUID?
    
    var body: some View {
       /* Button(action: {
            selectedItem = myChatList.id
            //            dump(weather.id)
        }, label: {
            
        })*/
        HStack {
            Image(myChatList.image)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            //.padding(0.0)
            Text(myChatList.name)
            Text(myChatList.messagePreview).frame(maxWidth: .infinity)
        }
    }
}
