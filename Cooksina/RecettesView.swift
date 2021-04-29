//
//  RecettesView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RecettesView: View {
    var body: some View {
        
        List(recettes) { recette in
            RecetteListRow(myRecette: recette)
        }
        
    }
}

struct RecetteListRow: View {
    let myRecette: Recette
    
    var body: some View {
        HStack {
            Image(myRecette.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(myRecette.titre)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(myRecette.description)
            }
        }
    }
}

struct FiltresView: View {
    
    @State private var regionIndex = 0
    @State var isSelected = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Picker(selection: $regionIndex, label: Text("Région")) {
                        Text("Région 1")
                        Text("Région 2")
                        Text("Région 3")
                        Text("Région 4")
                    }
                    
                    Section(header: Text("Catégories")) {
                        
                        Toggle(isOn: $isSelected) {
                            Text("Végétarien")
                        }
                        
                        
                        Toggle(isOn: $isSelected) {
                            Text("Halal")
                        }
                        
                        Toggle(isOn: $isSelected) {
                            Text("Fêtes")
                        }
                        
                    }
                    
                } .navigationTitle("Filtres")
                HStack {
                    Button(action: {}) {
                        Text("Tout effacer")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(lineWidth: 2.0)
                            )
                    }
                    Button(action: {}) {
                        Text("Terminer")
                    } .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(2)
                }
            }
        }
    }
}


struct RecettesView_Previews: PreviewProvider {
    static var previews: some View {
        RecettesView()
    }
}

struct Filtres_Previews: PreviewProvider {
    static var previews: some View {
        FiltresView()
    }
}
