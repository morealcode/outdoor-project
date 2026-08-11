//
//  DayTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct DayTile: View {
    @Environment(AppStore.self) private var store

    let day: Days

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    var isSelected: Bool {
        store.currentUser.preferences.availableDays[day] ?? false
    }

    var body: some View {
        Button {
            preferencesViewModel.changeDaysFavorite(day)
        } label: {
            Text(day.firstThreeCharacters)
                .bold()
                .foregroundStyle(isSelected ? .black : .secondary.opacity(0.5))
                .frame(width: 45, height: 45)
                .background(
                    isSelected ? .black : .secondary.opacity(0.5),
                    in: .rect(cornerRadius: 12).stroke(lineWidth: 2)
                )
                .contentShape(.rect(cornerRadius: 12))
        }
    }
}

#Preview {
    let store = MockData.makeStore()
    DayTile(day: .monday)
        .environment(store)
}
