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
    
    func createur() -> Utilisateur? {
        utilisateurs.first(where: {auteur == $0.nom})
    }
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
    case afriqueDuNord = "Afrique du Nord"
    case afriqueCentrale = "Afrique centrale"
    case afriqueAustrale = "Afrique australe"
    case afriqueDeLOuest = "Afrique de l'Ouest"
    case afriqueDeLEst = "Afrique de l'Est"
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
        case .afriqueDuNord:
            return "tajine"
        case .afriqueCentrale:
            return "poulet"
        case .afriqueAustrale:
            return "biltong"
        case .afriqueDeLOuest:
            return "poulet-sauce"
        case .afriqueDeLEst:
            return "afriqueDeLEst"
        case .asieOccidentale:
            return "asieOccidentale"
        case .asieCentrale:
            return "asieCentrale"
        case .asieDeLEst:
            return "asieDelEST"
        case .asieDuSud:
            return "asieDuSud"
        case .asieDuSudEst:
            return "asieSudEst"
        case .oceanie:
            return "oceanie"
        }
    }
    
}

enum Difficulte: String {
    case facile = "Facile"
    case moyen = "Moyen"
    case difficile = "Difficile"
}

// Utilisateurs

struct Utilisateur: Identifiable {
    var id = UUID()
    var nom: String
    var photo: String
    var ville: String
//    var recettes: [Recette]
}

var utilisateurs = [
    Utilisateur(nom: "Jason Briscoe", photo: "jason-briscoe", ville: "Paris"),
    Utilisateur(nom: "Jane Doe", photo: "jane-doe", ville: "Toulouse"),
    Utilisateur(nom: "Mélodie Guibord", photo: "P2", ville: "Nice"),
    Utilisateur(nom: "Pansy Fontaine", photo: "P3", ville: "Bordeaux"),
    Utilisateur(nom: "Henri Aubin", photo: "P1", ville: "Chartres"),
    Utilisateur(nom: "Marcel Champion", photo: "P4", ville: "Orléans"),
    Utilisateur(nom: "Benjamin Danterre", photo: "P6", ville: "Paris"),
    Utilisateur(nom: "Kévin Moisson", photo: "P7", ville: "Marseille"),
    Utilisateur(nom: "Ketlin Jannaire", photo: "P5", ville: "Tours"),
    Utilisateur(nom: "Emily Pomdapi", photo: "P9", ville: "Nanterre"),
    Utilisateur(nom: "Jessica Boullot", photo: "P11", ville: "Montpellier"),
    Utilisateur(nom: "Frédéric Agency", photo: "P8", ville: "Tourcoing"),
    Utilisateur(nom: "Eric Rodriguez", photo: "P10", ville: "Lille"),
    Utilisateur(nom: "Stéphanie Pallambra", photo: "P12", ville: "Lyon"),
    Utilisateur(nom: "Justine Pensai", photo: "P13", ville: "Dijon"),
    Utilisateur(nom: "Julie Coëtlin", photo: "P14", ville: "Biarritz"),
    Utilisateur(nom: "Marcus Lavet", photo: "P15", ville: "La Rochelle"),
]

