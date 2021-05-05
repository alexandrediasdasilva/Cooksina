//
//  RecetteDetails.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RecetteDetails: View {
    
    @State var pickerElementSelectionne = "Ingrédients"
    @State private var hideText : Bool = false
    
    let recetteChoisie: Recette
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                ZStack(alignment: .bottom) {
                    Image(recetteChoisie.image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(height: 350)
                        .clipShape(Rectangle())
                    
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top))
                        .frame(height: 100)
                        .opacity(0.9)
                    
                    
                    Text(recetteChoisie.titre)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                }
                
                HStack(alignment: .center, spacing: 30) {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(Color.gray)
                        Text("\(recetteChoisie.region.rawValue) ")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                    }
                    
                    HStack {
                        Image(systemName: "suit.heart.fill")
                        Text("999")
                    } .font(.caption)
                    .foregroundColor(Color.red)
                    
                    
                } .padding(5)
                
                Divider()
                
                
                NavigationLink(destination: ProfilView()) {
                    
                    HStack(alignment: .top, spacing: 20) {
                        
                        if let utilisateur = recetteChoisie.createur() {
                            
                            
                            InfosAuteur(utilisateur: utilisateur)
                            
                            
                        } else {
                            Text(recetteChoisie.auteur)
                        }
                                                
                        VStack(alignment: .leading) {
                            
                            
                            Text("“\(recetteChoisie.description)”")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .italic()
                            
                        } .frame(width: 250, alignment: .topLeading)
                        
                    } .foregroundColor(.black) .padding()
                }
                
                Divider()
                
                StatsRecette(myrecetteChoisie: recetteChoisie)
                
                Divider()
                
                VStack {
                    
                    Picker(selection: $pickerElementSelectionne, label: Text("")) {
                        Text("Ingrédients").tag("Ingrédients")
                        Text("Ustensiles").tag("Ustensiles")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if pickerElementSelectionne == "Ingrédients" {
//                        Text("\(recetteChoisie.ingredients)")
                        
                        ForEach (recetteChoisie.ingredients) { ingredient in
                            
                            HStack {
                                Text("- ")
                                Text("\(ingredient.quantite) \(ingredient.unite) \(ingredient.nom)")
                            }
                        }
                        
                    } else if pickerElementSelectionne == "Ustensiles" {
                        Text("Remplacer par liste des ustensiles dynamique")
                    }
                    
                    Divider()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Préparation".uppercased())
                                .font(.headline)
                                .fontWeight(.semibold)
                            .padding()
                        
                        Text(recetteChoisie.instructions)
                            .padding()
                    }
                        
                   
                    
                    
                }
                
            } .navigationBarTitle("\(recetteChoisie.titre)", displayMode: .inline)
        }
    }
} 



struct StatsRecette: View {
    
    let myrecetteChoisie: Recette
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center){
                Image(systemName: "gauge")
                    .padding(.bottom, 1)
                Text("\(myrecetteChoisie.difficulte.rawValue)")
                    .font(.caption)}
            
            Spacer()
            
            VStack(alignment: .center){
                Image(systemName: "timer")
                    .padding(.bottom, 1)
                Text("\(myrecetteChoisie.temps) min").font(.caption)}
            
            Spacer()
            
            VStack(alignment: .center){
                Image(systemName: "person.3")
                    .padding(.bottom, 1)
                Text("\(myrecetteChoisie.nbPersonnes) pers.")
                    .font(.caption)}
            
            Spacer()
        } .padding()
    }
}

struct matériel: View {
    var body: some View {
        
        
        
        HStack{
            Image("batteur")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment:
                        .leading)
            Image("fouet")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment:
                        .center)
            Image("poele")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment:
                        .leading)        }
    }
}

struct InfosAuteur: View {
    
    let utilisateur: Utilisateur
    
    var body: some View {
        VStack {
            Image(utilisateur.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Text(utilisateur.nom)
                .font(.headline)
                .padding(.bottom, 1)
        }
    }
}

struct RecetteDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        RecetteDetails(recetteChoisie: recettes[0])
    }
}
