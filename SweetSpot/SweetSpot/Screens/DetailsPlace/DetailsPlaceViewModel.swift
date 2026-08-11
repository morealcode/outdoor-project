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
        Images (nom: "Palais Bahia",image: .bahia),
        Images (nom: "Palais Bahia",image: .bahia),
        Images (nom: "Palais Bahia",image: .bahia)
    ]
}
