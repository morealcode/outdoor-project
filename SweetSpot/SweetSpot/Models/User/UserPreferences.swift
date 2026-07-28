//
//  UserPreferences.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct UserPreferences {
    var savedAddresses: [SavedAddress] = []
    var homeAddress: SavedAddress?
    var workAddress: SavedAddress?
    var favoriteTransportModes: [TransportMode] = []
    var favoritePlaceCategories: [PlaceCategory] = []
}
