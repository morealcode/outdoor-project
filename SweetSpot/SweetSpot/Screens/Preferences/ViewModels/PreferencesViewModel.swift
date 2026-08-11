//
//  PreferencesViewModel.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct PreferencesViewModel {
    let store: AppStore

    init(store: AppStore) {
        self.store = store
    }

    func changeFavoriteAddress(_ favorite: FavoriteAddress) {
        store.currentUser.preferences.favoriteAddress = favorite
        print("Change favorite to ", favorite)
        print(store.currentUser.preferences.favoriteAddress)
    }

    func changeFavoriteTransport(_ favorite: TransportMode) {
        store.currentUser.preferences.favoriteTransportModes = favorite
        print("Change favorite transport mode to ", favorite)
        print(store.currentUser.preferences.favoriteTransportModes)
    }

    func isTransportSelected(transport: TransportMode) -> Bool {
        store.currentUser.preferences.favoriteTransportModes == transport
    }

    func changeCuisineFavorite(_ cuisineType: CuisineType) {
        store.currentUser.preferences.favoritesCuisine[cuisineType]?.toggle()
        print("Change favorite cuisine", cuisineType, "to", store.currentUser.preferences.favoritesCuisine[cuisineType] ?? "error")
    }
    
    func changeBudget(_ budget: Int){
        store.currentUser.preferences.budget = budget
        print("Change budget to", budget)
    }
}
