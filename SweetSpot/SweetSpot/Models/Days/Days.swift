//
//  Days.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//

import Foundation

enum Days: String, CaseIterable, Identifiable {
    case monday = "Lundi"
    case tuesday = "Mardi"
    case wednesday = "Mercredi"
    case thursday = "Jeudi"
    case friday = "Vendredi"
    case saturday = "Samedi"
    case sunday = "Dimanche"

    var id: Self { self }

    var firstThreeCharacters: String {
        String(self.rawValue.prefix(3))
    }
}
