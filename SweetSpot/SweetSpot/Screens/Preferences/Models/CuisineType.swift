//
//  CuisineType.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import Foundation

struct CuisineType: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
    
    
    static let arrOfCuisineType = [
        CuisineType(name: "Française", emoji: "🥐"),
        CuisineType(name: "Japonaise", emoji: "🍣"),
        CuisineType(name: "Italienne", emoji: "🍝"),
        CuisineType(name: "Asiatique", emoji: "🍜"),
        CuisineType(name: "Végétarien", emoji: "🥗"),
        CuisineType(name: "Américaine", emoji: "🍔"),
        CuisineType(name: "Fruits de mer", emoji: "🦞"),
        CuisineType(name: "Bar à vin", emoji: "🍷")
    ]
}


