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
        VStack{
        Text("Hello, \(discussion.name)!")
            Spacer()
            Image(systemName: discussion.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100.0)
            Spacer()
        }
    }
}

struct ChatDiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDiscussionView(discussion:ChatList(name: "Tornado", image: "1", messagePreview: "coucou"))
    }
}
