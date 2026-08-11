//
//  SaveAddress.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct SavedAddress: Identifiable {
    let id: UUID = UUID()
    var name: String
    var address: String
    var location: GeoPoint?
}
