//
//  MainView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView {

            CarteView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Carte")
                }

            ChatView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Chat")
                }

            ProfilView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profil")
                }
        }
        
    }
    
}




struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
