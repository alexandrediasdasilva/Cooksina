//
//  MapView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

// On créé une variable pour stocker les résultats filtrés

struct MapView: View {
    
//    let recettesEurope = recettes.filter { recette in
//        recette.region == .europe
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MapView.swift")
    //            Text(listRegions())
            } .navigationTitle("Carte")
        }
    }
}

//func listRegions() -> String {
//    for region in Region.allCases {
//        return region.rawValue
//    }
//
//    Region.allCases.forEach { print($0) }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
