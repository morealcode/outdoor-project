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
    var favoriteAddress: FavoriteAddress = .home
    var favoriteTransportModes: TransportMode = .bus
    var favoritePlaceCategories: [PlaceCategory] = []
    // TODO: - Vérifier si le type de données est correct
    // ça peut être en heure
    var travelTime: Int?
    
    var isHomeFavorite: Bool {
        return favoriteAddress == .home
    }
}

