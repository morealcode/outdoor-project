//
//  FavoriteAddress.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//


enum FavoriteAddress: String, CaseIterable, Identifiable {
    case home = "Domicile"
    case work = "Travail"
    
    var id: Self { self }
}
