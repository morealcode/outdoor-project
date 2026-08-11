//
//  CuisineType.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import Foundation

//struct CuisineType: Identifiable {
//    let id = UUID()
//    let name: String
//    let emoji: String
//
//
//    static let arrOfCuisineType = [
//        CuisineType(name: "Française", emoji: "🥐"),
//        CuisineType(name: "Japonaise", emoji: "🍣"),
//        CuisineType(name: "Italienne", emoji: "🍝"),
//        CuisineType(name: "Asiatique", emoji: "🍜"),
//        CuisineType(name: "Végétarien", emoji: "🥗"),
//        CuisineType(name: "Américaine", emoji: "🍔"),
//        CuisineType(name: "Fruits de mer", emoji: "🦞"),
//        CuisineType(name: "Bar à vin", emoji: "🍷")
//    ]
//}

enum CuisineType: String, CaseIterable, Identifiable {
    case francais = "Française"
    case japonaise = "Japonaise"
    case italienne = "Italienne"
    case asiatique = "Asiatique"
    case vegetarien = "Végétarien"
    case americain = "Américain"
    case fruitsdemer = "Fruits de mer"
    case baravin = "Bar à vin"

    var id: Self { self }

    var emoji: String {
        switch self {
        case .francais:
            return "🥐"
        case .japonaise:
            return "🍣"
        case .italienne:
            return "🍝"
        case .asiatique:
            return "🍜"
        case .vegetarien:
            return "🥗"
        case .americain:
            return "🍔"
        case .fruitsdemer:
            return "🦞"
        case .baravin:
            return "🍷"
        }
    }
}
