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
            
            VStack {
                
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
                                    
//                                    Button(action: {}) {Image(systemName: "plus")
//                                    }
            )
            
            
        }
    }
}
    
    // Composants/extractions de vue
    
    struct Grid: View {
        var body: some View {
            ScrollView {
                
                // Voir si je dois passer regionChoisie en optionnel pour ne pas être obligé de le renseigner dans le cas où l'utilisateur veut voir toutes les recettes sans filtrage
                
//                NavigationLink(destination:
                                                      
//                    RecettesView(regionChoisie: "", texteRecherche: ""))
//                    {
//                    Text("Toutes les recettes")
//                }
                
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top)
                ], alignment: .leading, spacing: 16, content: {
                    
                    ForEach(Region.allCases, id: \.self) { region in
                        
                        NavigationLink(destination: RecettesView(regionChoisie: region, texteRecherche: "")) {
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Image(region.nomImage)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                
                                Text(region.rawValue)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .padding(.top, 4)
                                    .font(.caption2)
                                
                                Spacer()
                            }
                            
                        }
                    }
                    
                }) .padding(.horizontal, 12)
            }
        }
    }
    
    
    
    // Previews
    
    struct RegionsView_Previews: PreviewProvider {
        static var previews: some View {
            RegionsView()
                
        }
    }
