//
//  RecettesView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RecettesView: View {
    
    let regionChoisie: Region
    
    @State var texteRecherche: String
    @State var isSearching = false
    @State private var showingSheet = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                VStack {
                    BarreDeRecherche(
                        texteRecherche: $texteRecherche,
                        isSearching: $isSearching,
                        showingSheet: $showingSheet
                    )
                }
                
                VStack {
                    ForEach(recettes.filter({ $0.region == regionChoisie && ($0.titre.localizedCaseInsensitiveContains(texteRecherche) || $0.description.localizedCaseInsensitiveContains(texteRecherche) || texteRecherche.isEmpty) })) { recette in
                        
                        NavigationLink(
                            destination: RecetteDetails(recetteChoisie: recette)
                        ) {
                            RecetteListRow(myRecette: recette)
                        }
                        
                    }
                } .padding()
                Spacer()
            } .navigationTitle("\(regionChoisie.rawValue)")
        }
    }
}

struct FiltresView: View {
    
    @State private var regionIndex = 0
    @State var isSelected = false
    @Environment(\.presentationMode) var presentationMode
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {

                    
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
                    Button("Annuler") {
                        presentationMode.wrappedValue.dismiss()
                    } .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(lineWidth: 2.0)
                    )
                    Button(action: {}) {
                        Text("Terminer")
                    } .padding()
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(2)
                }
            }
        }
    }
}

struct BarreDeRecherche: View {
    
    @Binding var texteRecherche: String
    @Binding var isSearching: Bool
    @Binding var showingSheet: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Rechercher", text: $texteRecherche)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: { texteRecherche = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                    Button(action: { showingSheet = true }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                    .sheet(isPresented: $showingSheet) {
                        FiltresView()
                    }
                } .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )                    .transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                
                Button(action: {
                    isSearching = false
                    texteRecherche = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Annuler")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}

struct RecetteListRow: View {
    
    let myRecette: Recette
    
    var body: some View {
        HStack(alignment: .top, spacing: 20.0) {
            
            Image(myRecette.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90)
                .cornerRadius(10)
                .clipShape(Rectangle())
            
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 3.0) {
                    Text(myRecette.titre)
                        .foregroundColor(Color.black)
                    Text(myRecette.description)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .lineLimit(1)
                    if let utilisateur = myRecette.createur() {
                        InfosUtilisateur(utilisateur: utilisateur)
                    } else {
                        Text(myRecette.auteur)
                    }
                }
                
                HStack {
                    
                    HStack(spacing: 5.0) {
                        Image(systemName: "suit.heart.fill")
                        Text("999")
                    } .font(.caption)
                    .foregroundColor(Color("AccentColor"))
                    .padding(.top, 1.0)
                    
                    
                    HStack(spacing: 5.0) {
                        Image(systemName: "timer")
                        Text("\(myRecette.temps) min")
                    } .font(.caption)
                    .foregroundColor(Color.gray)
                    .padding(.top, 1.0)
                    
                }
                
            }
            
            Spacer()
            
        } .padding(.bottom)
    }
}

struct InfosUtilisateur: View {
    
    let utilisateur: Utilisateur
    
    var body: some View {
        HStack {
            Image(utilisateur.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
                .clipShape(Circle())
            Text("par \(utilisateur.nom)")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}


struct RecettesView_Previews: PreviewProvider {
    static var previews: some View {
        RecettesView(regionChoisie: .asieDuSud, texteRecherche: "")
    }
}

struct Filtres_Previews: PreviewProvider {
    static var previews: some View {
        FiltresView()
    }
}
