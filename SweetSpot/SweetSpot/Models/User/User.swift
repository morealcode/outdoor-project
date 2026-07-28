//
//  User.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    var name: String
    var preferences: UserPreferences
}
