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
                        .frame(width: 390, height: 350)
                        .clipped()
                    
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
                    .foregroundColor(Color("AccentColor"))
                    
                    
                } .padding(5)
                
                Divider()
                
                
                VStack() {
                    
                    if let utilisateur = recetteChoisie.createur() {
                        
                        
                        InfosAuteur(utilisateur: utilisateur)
                            .padding(.bottom)
                        
                        
                    } else {
                        Text(recetteChoisie.auteur)
                    }
                    
                    
                    
                    Text("Notes de l‘auteur".uppercased())
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    
                    Text("“\(recetteChoisie.description)”")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .italic()
                        .padding(.bottom)
                    
                    
                    
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("AccentColor"))
                        
                        
                        HStack(spacing: 5) {
                            
                            Image(systemName: "message.fill")
                            
                            Text("Contacter")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                        } .padding(10) .foregroundColor(Color.white)
                        
                        
                        
                    }.frame(width: 130, height: 40)
                    .padding(.bottom)
                    
                    
                } .padding()
                
                
                
                
                Divider()
                
                StatsRecette(myrecetteChoisie: recetteChoisie)
                
                Divider()
                
                VStack(alignment: .leading) {
                    
                    Picker(selection: $pickerElementSelectionne, label: Text("")) {
                        Text("Ingrédients").tag("Ingrédients")
                        Text("Ustensiles").tag("Ustensiles")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if pickerElementSelectionne == "Ingrédients" {
                        
                        ForEach (recetteChoisie.ingredients) { ingredient in
                            
                            HStack {
                                
//                                Text("\(ingredient.quantite) \(ingredient.unite) \(ingredient.nom)")
                                
                                if ingredient.unite != "" {
                                    Text("\(ingredient.quantite) \(ingredient.unite) \(ingredient.nom)")
                                } else {
                                    Text("\(ingredient.quantite) \(ingredient.nom)")
                                }


//                                VStack(alignment: .leading) {
//
//                                } .frame(width: 100)
//
//                                Spacer()
//
//
//                                VStack {
//
//
//                                }
                                
                                
                                
                                
                            } .padding(.horizontal)
                            .padding(.vertical, 3)
                        }
                        
                    } else if pickerElementSelectionne == "Ustensiles" {
                        Text(recetteChoisie.ustensiles)
                            .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Préparation".uppercased())
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding()
                        
                        Text(recetteChoisie.instructions)
                            .padding(.horizontal)
                    }
                    
                    
                    
                    
                } .padding(.horizontal)
                
            } .navigationBarTitle("\(recetteChoisie.titre)", displayMode: .inline)
        }
    }
} 



struct StatsRecette: View {
    internal init(myrecetteChoisie: Recette) {
        self.myrecetteChoisie = myrecetteChoisie
    }
    
    
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

struct InfosAuteur: View {
    
    let utilisateur: Utilisateur
    
    var body: some View {
        VStack {
            
            Image(utilisateur.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Text("proposée par".uppercased())
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
            
            Text(utilisateur.nom)
                .font(.headline)
                .padding(.bottom, 1)
            
        }
    }
}

struct RecetteDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        RecetteDetails(recetteChoisie: recettes[11])
    }
}
