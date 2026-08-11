//
//  AdressRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct AdressRow: View {
    @Environment(AppStore.self) private var store

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    var body: some View {

        HStack(spacing: 16) {
            Button {
                preferencesViewModel.changeFavoriteAddress(.home)

            } label: {
                AdressTile(
                    isSelected: store.currentUser.preferences.isHomeFavorite,
                    iconLeft: "house.fill",
                    iconRight: "checkmark.circle.fill",
                    endroit: "Domicile",
                    adress: "12 Rue de la Paix, Paris"
                )
            }

            Button {
                preferencesViewModel.changeFavoriteAddress(.work)

            } label: {
                AdressTile(
                    isSelected: !store.currentUser.preferences.isHomeFavorite,
                    iconLeft: "briefcase.fill",
                    iconRight: "checkmark.circle.fill",
                    endroit: "Travail",
                    adress: "45 av. des Champs Elysées, Paris"
                )
            }
        }
        .buttonStyle(.plain)
        .padding(.bottom, 16)

    }
}

#Preview {
    let store = MockData.makeStore()
    AdressRow()
        .environment(store)
}
