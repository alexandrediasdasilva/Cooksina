//
//  RecetteDetails.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RecetteDetails: View {
    
    let recetteChoisie: Recette
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Image(recetteChoisie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipShape(Rectangle())
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc scelerisque viverra mauris in aliquam sem. A iaculis at erat pellentesque adipiscing commodo elit. Netus et malesuada fames ac turpis. Adipiscing elit pellentesque habitant morbi tristique senectus et netus. Sapien et ligula ullamcorper malesuada proin libero. Nunc sed velit dignissim sodales ut eu sem integer. Nullam eget felis eget nunc. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Auctor augue mauris augue neque gravida in. Netus et malesuada fames ac turpis. Adipiscing elit pellentesque habitant morbi tristique senectus et netus. Sapien et ligula ullamcorper malesuada proin libero. Nunc sed velit dignissim sodales ut eu sem integer. Nullam eget felis eget nunc. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Auctor augue mauris augue neque gravida in.") .padding()
                Spacer()
            } .navigationTitle("\(recetteChoisie.titre)")
        }
    }
}

//struct RecetteDetails_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RecetteDetails(recetteChoisie: recetteTest)
//    }
//}
