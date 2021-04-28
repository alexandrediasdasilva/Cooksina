//
//  RecettesView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RecettesView: View {
    var body: some View {
        
        List(recettes) { recette in
            RecetteListRow(myRecette: recette)
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
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(myRecette.titre)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(myRecette.description)
            }
        }
    }
}


struct RecettesView_Previews: PreviewProvider {
    static var previews: some View {
        RecettesView()
    }
}
