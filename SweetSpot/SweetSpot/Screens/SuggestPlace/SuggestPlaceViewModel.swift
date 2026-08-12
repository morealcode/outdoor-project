//
//  Untitled.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct Images : Identifiable {
    let id = UUID()
    let nom: String
    let image: ImageResource
    
    static let caroussel : [Images] = [
        Images (nom: "Palais Bahia", image: .bahia),
        Images (nom: "Place Jemaa El Fna",image: .jemaaelfna),
        Images (nom: "Koutoubia",image: .koutoubia),
        Images (nom: "Musée du Louvre",image: .louvre),
        Images (nom: "Tour Eiffel",image: .toureiffel),
    ]
}


struct LocationType: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let color: Color
    
    
    static let arrOfLocationType = [
        LocationType(name: "Tendance", symbol: "flame", color: .orange),
        LocationType(name: "Nature", symbol: "leaf", color: .green),
        LocationType(name: "Festif", symbol: "music.note", color: .purple),
        LocationType(name: "Terasse", symbol: "sun.max", color: .yellow),
    ]
}

struct Lieu: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let imageName: ImageResource
    let matchPercentage: Int
    let matchColor: Color
    let rating: Double
    let reviewCount: Int
    let duration: String
    let priceRange: String
    let tag: String
    let tagColor: Color
    var isSelected: Bool = false

    static let samples: [Lieu] = [
        Lieu(
            name: "Le Rooftop des Lumières",
            category: "Rooftop · Paris 11e",
            imageName: .bahia,
            matchPercentage: 97,
            matchColor: .green,
            rating: 4.8,
            reviewCount: 128,
            duration: "18 min",
            priceRange: "35–60 € /pers.",
            tag: "Cocktails",
            tagColor: Color.teal,
            isSelected: true
        ),
        Lieu(
            name: "L'Atelier Végétal",
            category: "Restaurant · Paris 10e",
            imageName: .jemaaelfna,
            matchPercentage: 91,
            matchColor: .green,
            rating: 4.6,
            reviewCount: 96,
            duration: "12 min",
            priceRange: "20–40 € /pers.",
            tag: "Végétarien",
            tagColor: .green
        ),
        Lieu(
            name: "Loft Galerie 21",
            category: "Événementiel · Paris 19e",
            imageName: .koutoubia,
            matchPercentage: 88,
            matchColor: .purple,
            rating: 4.7,
            reviewCount: 74,
            duration: "25 min",
            priceRange: "40–80 € /pers.",
            tag: "Privatisable",
            tagColor: .purple
        ),
        Lieu(
            name: "La Terrasse du Canal",
            category: "Bar · Paris 12e",
            imageName: .louvre,
            matchPercentage: 84,
            matchColor: .orange,
            rating: 4.5,
            reviewCount: 212,
            duration: "15 min",
            priceRange: "20–30 € /pers.",
            tag: "Terrasse",
            tagColor: .orange
        )
    ]
}

