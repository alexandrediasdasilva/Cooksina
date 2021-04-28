//
//  ContentView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct Recette: Identifiable {
    var id = UUID()
    var titre: String
    var description: String
    var image: String
    var auteur: String
    var categories: [String]
    var region: Region
    var nbPersonnes: Int
    var difficulte: Difficulte
    var temps: Int // en minutes
    var ingredients = [String]()
    var instructions: String
    var ustensiles: String
}

struct Utilisateur: Identifiable {
    var id = UUID()
    var nom: String
    var photo: String
    var recettes: [String]
}

// On définit une struct ingrédient composée d'une quantité et d'un nom
struct Ingredient {
    var nom: String
    var quantite: Float // unité variable ?
}

enum Region: String {
    // Chaque région est un cas de l'énum
    case europe = "Europe"
    case ameriqueDuNord = "Amérique du Nord"
    case ameriqueCentraleEtAntilles = "Amérique Centrale et Antilles"
    case ameriqueDuSud = "Amérique du Sud"
    case afrique = "Afrique"
    case afriqueDuNord = "Afrique du Nord"
    case afriqueCentrale = "Afrique central"
    case afriqueAustrale = "Afrique australe"
    case afriqueDeLOuest = "Afrique de l'Ouest"
    case afriqueDeLEst = "Afrique de l'Est"
    case afriqueInsulaire = "Afrique insulaire"
    case asie = "Asie"
    case asieOccidentale = "Asie occidentale"
    case asieCentrale = "Asie centrale"
    case asieDeLEst = "Asie de l'Est"
    case asieDuSud = "Asie du Sud"
    case asieDuSudEst = "Asie du Sud-Est"
    case oceanie = "Océanie"
}

enum Difficulte {
    // Chaque niveau de difficulté est un cas de l'énum
    case facile, moyen, difficile
}

struct MainView: View {
    
    @State private var recettes = [
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
    
    var body: some View {
  

        
        TabView {

            Text("Carte")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Carte")
                }

            Text("Chat")
                .tabItem {
                    Image(systemName: "message")
                    Text("Chat")
                }

            Text("Profil")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profil")
                }
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




struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
