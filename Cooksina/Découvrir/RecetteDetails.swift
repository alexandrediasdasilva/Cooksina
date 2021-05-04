//
//  RecetteDetails.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RecetteDetails: View {
    
    @State var detailRecette = ""
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
                    
                    if let utilisateur = recetteChoisie.createur() {
                        
                        NavigationLink(destination: ProfilView()) {
                            InfosUtilisateur(utilisateur: utilisateur)
                        }
                        
                    } else {
                        Text(recetteChoisie.auteur)
                    }
                    
                    HStack {
                        Image(systemName: "suit.heart.fill")
                        Text("999")
                    } .font(.caption)
                    .foregroundColor(Color.red)
                        
                    
                } .padding(5)
                
                Text("\(recetteChoisie.description)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Divider()
                
                lesIcones(myrecetteChoisie: recetteChoisie)
                
                VStack{
                    
                    Picker(selection: $detailRecette, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                        Text("Ingrédients").tag("Ingrédients")
                        Text("Ustensiles").tag("Ustensiles")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if detailRecette == "Ustenciles" {
                        Text("Remplacer par liste des ustensiles dynamique")
                    } else {
                        Text("Remplacer par liste des ustensiles dynamique")
                    }
                    
                    Divider()
                    
                    Text(recetteChoisie.instructions)
                        .padding()
                    
                }
                
            } .navigationBarTitle("\(recetteChoisie.titre)", displayMode: .inline)
        }
    }
} 

struct RecetteDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        RecetteDetails(recetteChoisie: recettes[1])
    }
}

struct lesIcones: View {
    
    let myrecetteChoisie: Recette
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center){
                Image("toque")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 30)
                Text("\(myrecetteChoisie.difficulte.rawValue)")
                    .font(.caption)}
            
            Spacer()
            
            VStack(alignment: .center){
                Image("chrono")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 30)
                Text("\(myrecetteChoisie.temps) min").font(.caption)}
            
            Spacer()

            VStack(alignment: .center){
                Image("groupes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text("\(myrecetteChoisie.nbPersonnes) pers")
                    .font(.caption)}
            
            Spacer()
        }
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


//
//{
//    VStack(alignment: .leading) {
//        ScrollView {
//            Image(recetteChoisie.image)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(height: 300)
//                .clipShape(Rectangle())
//            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc scelerisque viverra mauris in aliquam sem. A iaculis at erat pellentesque adipiscing commodo elit. Netus et malesuada fames ac turpis. Adipiscing elit pellentesque habitant morbi tristique senectus et netus. Sapien et ligula ullamcorper malesuada proin libero. Nunc sed velit dignissim sodales ut eu sem integer. Nullam eget felis eget nunc. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Auctor augue mauris augue neque gravida in. Netus et malesuada fames ac turpis. Adipiscing elit pellentesque habitant morbi tristique senectus et netus. Sapien et ligula ullamcorper malesuada proin libero. Nunc sed velit dignissim sodales ut eu sem integer. Nullam eget felis eget nunc. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Auctor augue mauris augue neque gravida in.") .padding()
//            Spacer()
//        } .navigationTitle("\(recetteChoisie.titre)")
//    }
//}


////
////  RecetteDetails.swift
////  Cooksina
////
////  Created by Alexandre Dias Da Silva on 28/04/2021.
////
//
//import SwiftUI
//
//struct RecetteDetails: View {
//
//    let recetteChoisie: Recette
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            ScrollView {
//                Image(recetteChoisie.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(height: 300)
//                    .clipShape(Rectangle())
//                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc scelerisque viverra mauris in aliquam sem. A iaculis at erat pellentesque adipiscing commodo elit. Netus et malesuada fames ac turpis. Adipiscing elit pellentesque habitant morbi tristique senectus et netus. Sapien et ligula ullamcorper malesuada proin libero. Nunc sed velit dignissim sodales ut eu sem integer. Nullam eget felis eget nunc. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Auctor augue mauris augue neque gravida in. Netus et malesuada fames ac turpis. Adipiscing elit pellentesque habitant morbi tristique senectus et netus. Sapien et ligula ullamcorper malesuada proin libero. Nunc sed velit dignissim sodales ut eu sem integer. Nullam eget felis eget nunc. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Auctor augue mauris augue neque gravida in.") .padding()
//                Spacer()
//            } .navigationTitle("\(recetteChoisie.titre)")
//        }
//    }
//}
//
//struct RecetteDetails_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RecetteDetails(recetteChoisie: recettes[1])
//    }
//}
