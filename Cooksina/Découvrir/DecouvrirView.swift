//
//  DecouvrirView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RegionsView: View {
    
    //    func RandomRecette() -> Recette {
    //        let randomRecette = recettes.randomElement()!
    //        return randomRecette
    //    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    SelectionRedac()
                    
                    Divider()
                    
                    Grid()
                        .padding(.top, 12)
                    
                    Image("cooksina-lettering")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .padding()
                }
                .navigationTitle("Découvrir")
                
                .navigationBarItems(
                    trailing:
                        NavigationLink(destination: RecetteEdit()) {
                            Image(systemName: "plus")
                                .font(.title2)
                                
                        }
                )
                
                
            }
        }
    }
}

// Composants/extractions de vue

struct Grid: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Les régions 🗺️")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Voyagez sans vous déplacer")
                .foregroundColor(Color.gray)
            
            NavigationLink(destination: ToutesLesRecettes(texteRecherche: "")) {
                HStack(spacing: 3) {
                    Text("Toutes nos recettes".uppercased())
                        .foregroundColor(Color("AccentColor"))
                        .fontWeight(.bold)
                    Image(systemName: "chevron.forward")
                } .font(.caption)
                
            } .padding(.vertical)
            
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
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .padding(.top, 4)
                            
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
                .font(.title2)
                .fontWeight(.bold)
            
            Text("À table !")
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
                                    .frame(width: 150, height: 250)
                                
                                ZStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top))
                                        .frame(width: 150, height: 80)
                                        .opacity(0.9)
                                    
                                    Text(recette.titre)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .frame(width: 150, height: 50)
                                        .foregroundColor(.white)
                                }
                                
                            } .cornerRadius(10)
                        } .shadow(radius: 2)
                        
                    }
                }
            }
            
        } .padding()
    }
}

struct ToutesLesRecettes: View {
    
    @State var texteRecherche: String
    @State var isSearching = false
    @State private var showingSheet = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                BarreDeRecherche(
                    texteRecherche: $texteRecherche,
                    isSearching: $isSearching,
                    showingSheet: $showingSheet
                )
            }
            
            VStack {
                ForEach(recettes) { recette in
                    
                    NavigationLink(
                        destination: RecetteDetails(recetteChoisie: recette)
                    ) {
                        RecetteListRow(myRecette: recette)
                    }
                }
            } .padding() .navigationTitle("Toutes les recettes")
        }
    }
}


// Previews

struct RegionsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionsView()
    }
}

//
//struct ToutesLesRecettes_Previews: PreviewProvider {
//    static var previews: some View {
//        ToutesLesRecettes()
//        
//    }
//}
