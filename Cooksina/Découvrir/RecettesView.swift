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
    
        VStack {
            
            BarreDeRecherche(texteRecherche: $texteRecherche, isSearching: $isSearching, showingSheet: $showingSheet)
            Text("La Sélection de la rédac'")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(recettes) {i in
                        Image(i.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90.0, height: 90.0)
                           
                    }
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
                    .padding()
            }
            
            List(recettes) { recette in
                
                NavigationLink(
                    destination: RecetteDetails(recetteChoisie: recette),
                    label: {
                        RecetteListRow(myRecette: recette)
                    })
            } .navigationTitle("\(regionChoisie.rawValue)")

            
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
                    .frame(width: 75, height: 75)
                    .clipShape(Rectangle())
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
//                    Picker(selection: $regionIndex, label: Text("Région")) {
//                        Text("Région 1")
//                        Text("Région 2")
//                        Text("Région 3")
//                        Text("Région 4")
//                    }
                    
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
                    .background(Color.blue)
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

//struct RecettesView: View {
//
//    let regionChoisie: Region
//
//    @State var texteRecherche: String
//    @State var isSearching = false
//    @State private var showingSheet = false
//
//    var body: some View {
//
//            VStack {
//                BarreDeRecherche(texteRecherche: $texteRecherche, isSearching: $isSearching, showingSheet: $showingSheet)
//
//                List(recettes.filter({ $0.region == regionChoisie && ($0.titre.localizedCaseInsensitiveContains(texteRecherche) || $0.description.localizedCaseInsensitiveContains(texteRecherche) || texteRecherche.isEmpty) })) { recette in
//
//                    NavigationLink(destination: RecetteDetails(recetteChoisie: recette)) {
//                        RecetteListRow(myRecette: recette)
//                    }
//                }
//            } .navigationTitle("\(regionChoisie.rawValue)")
//    }
//}

//struct RecetteListRow: View {
//
//    let myRecette: Recette
//
//    var body: some View {
//        HStack(alignment: .top) {
//            Image(myRecette.image)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 80, height: 80)
//                .clipShape(Rectangle())
////                .cornerRadius(10)
//            VStack(alignment: .leading) {
//                Text(myRecette.titre)
//                Text(myRecette.description)
//                    .font(.subheadline)
//                    .foregroundColor(Color.gray)
//            }
//        }
//    }
//}


//
//struct FiltresView: View {
//
//    @State private var regionIndex = 0
//    @State var isSelected = false
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Form {
//                    //                    Picker(selection: $regionIndex, label: Text("Région")) {
//                    //                        Text("Région 1")
//                    //                        Text("Région 2")
//                    //                        Text("Région 3")
//                    //                        Text("Région 4")
//                    //                    }
//
//                    Section(header: Text("Catégories")) {
//
//                        Toggle(isOn: $isSelected) {
//                            Text("Végétarien")
//                        }
//
//
//                        Toggle(isOn: $isSelected) {
//                            Text("Halal")
//                        }
//
//                        Toggle(isOn: $isSelected) {
//                            Text("Fêtes")
//                        }
//
//                    }
//
//                } .navigationTitle("Filtres")
//                HStack {
//                    Button("Annuler") {
//                        presentationMode.wrappedValue.dismiss()
//                    } .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 2)
//                            .stroke(lineWidth: 2.0)
//                    )
//                    Button(action: {}) {
//                        Text("Terminer")
//                    } .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(2)
//                }
//            }
//        }
//    }
//}
//
//
//struct RecettesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecettesView(regionChoisie: .asieDuSud, texteRecherche: "")
//    }
//}
//
////struct Filtres_Previews: PreviewProvider {
////    static var previews: some View {
////        FiltresView()
////    }
////}


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
