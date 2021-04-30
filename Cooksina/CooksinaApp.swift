//
//  CooksinaApp.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

@main
struct CooksinaApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {

                RegionsView()
                    .tabItem {
                        Image(systemName: "globe")
                        Text("Découvrir")
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
}
