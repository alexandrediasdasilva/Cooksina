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

struct RecettesView_Previews: PreviewProvider {
    static var previews: some View {
        RecettesView()
    }
}
