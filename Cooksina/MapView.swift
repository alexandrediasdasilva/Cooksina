//
//  MapView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

// On créé une variable pour stocker les résultats filtrés

struct MapView: View {
    
    var recettes = [
        Recette(
            titre: "Poulet curry aux oignons",
            description: "Spécialité indienne assaisonnée au paprika et au curry",
            image: "poulet-curry",
            auteur: "Jane Doe",
            categories: ["Repas"],
            region: .asieDuSud,
            nbPersonnes: 4,
            difficulte: .facile,
            temps: 20,
            instructions: """
            ÉTAPE 1
            
            Mettre une grande poêle à chauffer. Couper les oignons en petits morceaux, et les faire cuire à feu assez fort.

            ÉTAPE 2

            Remuer, en ajoutant du curry et du cumin.

            ÉTAPE 3

            Couper les blancs de poulet en morceaux, les ajouter dans la poêle et remettre des épices; tourner.

            ÉTAPE 4

            Baisser le feu, et ajouter 2 cuillères à soupe de crème.

            ÉTAPE 5

            Après 5 min de cuisson, remettre 2 cuillères à soupe de crème et des épices (si nécessaire).

            ÉTAPE 6
            Si le plat est fait à l'avance, remettre un peu de crème au moment de réchauffer car la sauce s'évapore.

            ÉTAPE 7
            Bon appétit
""",
            ustensiles: "Poêle, couteau, cuillère, planche à découper"),
        
        Recette(
            titre: "Ragoût au bœuf",
            description: "Spécialité indienne assaisonnée au paprika et au curry",
            image: "ragout-boeuf",
            auteur: "Jane Doe",
            categories: ["Repas"],
            region: .asieDuSud,
            nbPersonnes: 4,
            difficulte: .facile,
            temps: 20,
            instructions: """
            ÉTAPE 1
            
            Mettre une grande poêle à chauffer. Couper les oignons en petits morceaux, et les faire cuire à feu assez fort.
""",
            ustensiles: "Poêle, couteau, cuillère, planche à découper"),
        
        Recette(
            titre: "Soupe à la citrouille",
            description: "Spécialité indienne assaisonnée au paprika et au curry",
            image: "soupe-citrouille",
            auteur: "Jane Doe",
            categories: ["Repas"],
            region: .asieDuSud,
            nbPersonnes: 4,
            difficulte: .facile,
            temps: 20,
            instructions: """
            ÉTAPE 1
            
            Mettre une grande poêle à chauffer. Couper les oignons en petits morceaux, et les faire cuire à feu assez fort.
""",
            ustensiles: "Poêle, couteau, cuillère, planche à découper")
    ]
    
//    let recettesEurope = recettes.filter { recette in
//        recette.region == .europe
//    }
    
    var body: some View {
        List(recettes) { recette in
            RecetteListRow(myRecette: recette)
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
