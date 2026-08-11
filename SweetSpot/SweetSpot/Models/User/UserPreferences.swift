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
    var favoriteTransportModes: TransportMode = .transport
    var favoritePlaceCategories: [PlaceCategory] = []
    // TODO: - Vérifier si le type de données est correct
    // ça peut être en heure
    var favoriteTravelTime: Int?
    var budget: Int?
    var favoritesCuisine: [CuisineType: Bool] = [:
        //        .francais: true
        //        .japonaise: false,
        //        .italienne: false,
        //        .asiatique: false,
        //        .vegetarien: false,
        //        .americain: false,
        //        .fruitsdemer: false,
        //        .baravin: false,
    ]

    var isHomeFavorite: Bool {
        return favoriteAddress == .home
    }

    init() {
        for cuisine in CuisineType.allCases {
            self.favoritesCuisine[cuisine] = false
        }
    }
}
