//
//  vars.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

// Recettes

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
    var ingredients = [Ingredient]()
    var instructions: String
    var ustensiles: String
}

// On définit une struct ingrédient composée d'une quantité et d'un nom
struct Ingredient: Identifiable {
    var id = UUID()
    var nom: String
    var quantite: String // unité variable ?
    var suppression: Bool
}

enum Region: String, CaseIterable {
    case europe = "Europe"
    case ameriqueDuNord = "Amérique du Nord"
    case ameriqueCentraleEtAntilles = "Amérique Centrale et Antilles"
    case ameriqueDuSud = "Amérique du Sud"
    case afrique = "Afrique"
    case afriqueDuNord = "Afrique du Nord"
    case afriqueCentrale = "Afrique centrale"
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

// Déclarer une extension sur mon enum avec une ppté calculée qui génère le nom de l'image (switch sur self)

extension Region {
    
    var nomImage: String {
        
        switch self {
        case .europe:
            return "pasta"
        case .ameriqueDuNord:
            return "burger"
        case .ameriqueCentraleEtAntilles:
            return "colombo"
        case .ameriqueDuSud:
            return "empanadas"
        case .afrique:
            return "ragout"
        case .afriqueDuNord:
            return "tajine"
        case .afriqueCentrale:
            return "poulet"
        case .afriqueAustrale:
            return "biltong"
        case .afriqueDeLOuest:
            return "poulet-sauce"
        default:
            return ""
        }
        
    }
    
}

enum Difficulte {
    case facile, moyen, difficile
}

// Utilisateurs

struct Utilisateur: Identifiable {
    var id = UUID()
    var nom: String
    var photo: String
    var recettes: [String]
}
