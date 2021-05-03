//
//  DecouvrirView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RegionsView: View {
    
    func RandomRecette() -> Recette {
        let randomRecette = recettes.randomElement()!
        return randomRecette
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    SelectionRedac()
                    
                    Divider()
                    
                    Grid()
                        .padding(.top, 12)
                    
                }
                .navigationTitle("Découvrir")
                .navigationBarItems(
                    //                leading:
                    
                    //                                    NavigationLink(destination: RecetteDetails(recetteChoisie: randomRecette)
                    //                                    ) {
                    //                                        Button(action: {RandomRecette()}) {
                    //                                            Text("Surprenez-moi")
                    //                                            .fontWeight(.regular)
                    //                                        }
                    //                                    }
                    
                    
                    //                                    Button(action: {}) {
                    //                                        Text("Surprenez-moi")
                    //                                            .fontWeight(.regular)
                    //                                    }
                    //                                ,
                    trailing:
                        NavigationLink(destination: RecetteEdit()) {
                            Image(systemName: "plus")
                        }
                )
            }
        }
    }
}

// Composants/extractions de vue

struct Grid: View {
    var body: some View {
        
        // Voir si je dois passer regionChoisie en optionnel pour ne pas être obligé de le renseigner dans le cas où l'utilisateur veut voir toutes les recettes sans filtrage
        
        //                NavigationLink(destination:
        
        //                    RecettesView(regionChoisie: "", texteRecherche: ""))
        //                    {
        //                    Text("Toutes les recettes")
        //                }
        VStack(alignment: .leading) {
            Text("Les régions 🗺️")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Voyagez sans vous déplacer")
                .font(.title3)
                .foregroundColor(Color.gray)
            
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top)
            ], alignment: .leading, spacing: 16, content: {
                
                ForEach(Region.allCases, id: \.self) { region in
                    
                    NavigationLink(
                        destination: RecettesView(
                            regionChoisie: region,
                            texteRecherche: ""
                        )) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Image(region.nomImage)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Text(region.rawValue)
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .padding(.top, 4)
                                .font(.caption2)
                            
                            Spacer()
                        }
                        
                    }
                }
                
            })
        } .padding(.horizontal)
    }
}

struct SelectionRedac: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("La sélection de la rédac’ 😋")
                .font(.title)
                .fontWeight(.bold)
            
            Text("À table !")
                .font(.title3)
                .foregroundColor(Color.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recettes) { recette in
                        
                        NavigationLink(
                            destination: RecetteDetails(recetteChoisie: recette)
                        ) {
                            
                            ZStack(alignment: .bottom) {
                                Image(recette.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                
                                ZStack {
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width: 150, height: 50)
                                        .opacity(0.5)
                                    
                                    Text(recette.titre)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .frame(width: 150, height: 50)
                                        .foregroundColor(.white)
                                }
                                
                            } .cornerRadius(10)
                        }
                        
                    }
                }
            }
            
        } .padding()
    }
}

// Previews

struct RegionsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionsView()
        
    }
}
