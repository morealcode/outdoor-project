//
//  DetailsViewModel.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import Foundation

struct Participants: Identifiable {
    let id = UUID()
    let prenom : String
    let carTime : Double
    let busTime : Double
    let veloTime : Double
    let walkTime : Double
    
    static let membre: [Participants] = [
        Participants(prenom: "Camille", carTime: 18, busTime: 32, veloTime: 23, walkTime: 72),
        Participants(prenom: "Thomas", carTime: 24, busTime: 38, veloTime: 29, walkTime: 85),
        Participants(prenom: "Julie", carTime: 12, busTime: 20, veloTime: 15, walkTime: 45)
    ]
}

struct StyleLieux : Identifiable {
    let id = UUID()
    let nom : String
    let description : String
    let iconName : String
    
    static let exemple : [StyleLieux] = [
        StyleLieux(nom: "Vue Incroyable", description: "Panorama sur Paris", iconName: "sparkles"),
        StyleLieux(nom: "Ambiance", description: "Musique live et bonne vibe", iconName: "music.note.list"),
        StyleLieux(nom: "Cocktails", description: "Carte créative & produits frais", iconName: "wineglass"),
        StyleLieux(nom: "Privatisation", description: "Espaces disponibles pour groupes", iconName: "person.2.fill")
    ]
}
