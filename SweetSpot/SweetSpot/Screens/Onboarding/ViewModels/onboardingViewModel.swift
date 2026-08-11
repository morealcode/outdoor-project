//
//  onboardingViewModel.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//

import Foundation

struct OnboardingViewModel {
    let store: AppStore

    init(store: AppStore) {
        self.store = store
    }

    func updatePseudo(_ name: String) {
        store.currentUser.name = name
    }

    func updateHome(_ home: String) {
        store.currentUser.preferences.homeAddress = SavedAddress(
            name: "Domicile",
            address: home,
            // TODO: - Utiliser API pour récupérer GeoPoint d'une adresse
            // location: GeoPoint(latitude: 0.0, longitude: 0.0)
        )
    }

    func updateTransport(_ mode: TransportMode) {
        store.currentUser.preferences.favoriteTransportModes = mode
    }

    func updateTravelTime(_ travelTime: Int) {
        store.currentUser.preferences.favoriteTravelTime = travelTime
    }
}
