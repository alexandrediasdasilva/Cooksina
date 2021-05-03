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
        
        VStack (alignment: .leading){
                HStack {
                    Image(systemName: "heart.fill")
                        .padding(.leading)
                    Text(recetteChoisie.titre)
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.fill")
                }
            HStack(alignment: .center){
                Spacer()
                Text("\(recetteChoisie.region.rawValue) ")
                Spacer()
            }
            Image(recetteChoisie.image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(height: 250)
                       .clipShape(Rectangle())
            lesIcones(myrecetteChoisie: recetteChoisie)
                
                VStack{
                    Picker(selection: $detailRecette, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                        Text("Ingredients").tag("Ingredients")
                        Text("Ustenciles").tag("Ustenciles")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    if detailRecette == "Ustenciles"{
                        matériel()
                    } else {
                        Laliste()
                }
            }
                Spacer()
        } .navigationBarTitle("\(recetteChoisie.titre)", displayMode: .inline) 

    
        
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
        HStack (spacing: 55){
            Spacer()
            VStack(alignment: .center){
                Image("toque")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 30)
                Text("\(myrecetteChoisie.difficulte.rawValue)")
                    .font(.caption)}
            VStack(alignment: .center){
                Image("chrono")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 30)
                Text("\(myrecetteChoisie.temps) min").font(.caption)}
//            VStack(alignment: .center){
//                Image("marmite")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 60, height: 30)
//                Text(myrecetteChoisie.temps).font(.caption)}
            VStack(alignment: .center){
                Image("groupes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text("\(myrecetteChoisie.nbPersonnes)pers")
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

struct Laliste: View {
    var body: some View {
        VStack (spacing: 10){
            Text("- 250g de poulet")
            Text("- 100cl de crème")
            Text("-  Poivron rouge ")
            Text("- Cumin, Curry")
            Text("- 2  Oignons")
        }
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
