//
//  FoodTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct FoodTile: View {
    let food: CuisineType

    @Environment(AppStore.self) private var store

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    var isSelected: Bool {
        store.currentUser.preferences.favoritesCuisine[food] ?? false
    }

    var body: some View {
        Button {
            preferencesViewModel.changeCuisineFavorite(food)
        } label: {
            HStack {
                Text(food.emoji)
                    .opacity(isSelected ? 1.0 : 0.5)
                Text(food.rawValue)
                    .font(.caption)
                    .foregroundStyle(
                        isSelected ? .black : .secondary.opacity(0.5)
                    )
            }
        }
        .frame(height: 10)
        .padding()
        .background(
            isSelected ? .black : .secondary.opacity(0.5),
            in: .capsule.stroke(lineWidth: 2)
        )
        .contentShape(.capsule)
        .buttonStyle(.plain)
    }
}

#Preview {
    let store = MockData.makeStore()
    FoodTile(food: .francais)
        .environment(store)
}
//
//#Preview {
//    let store = MockData.makeStore()
//    PreferencesView()
//        .environment(store)
//}
