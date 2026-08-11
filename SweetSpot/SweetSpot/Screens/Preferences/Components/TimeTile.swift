//
//  TimeTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct TimeTile: View {
    @Environment(AppStore.self) private var store

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    var timeSelected: Int {
        store.currentUser.preferences.favoriteTravelTime ?? 0
    }
    
    let time: Int
    var body: some View {
        Button {
            preferencesViewModel.changeTime(time)
        } label: {
            HStack {
                Text("\(time)min")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(
                        timeSelected == time ? .white : .black
                    )
            }
            .padding(10)
            .frame(width: 70, height: 40)
            .background(
                timeSelected == time ? .black : .gray.opacity(0.1),
                in: .rect(cornerRadius: 12)
            )
        }
        .buttonStyle(.plain)
        .contentShape(.rect(cornerRadius: 12))
    }

}

#Preview {
    let store = MockData.makeStore()
    TimeTile(time: 15)
        .environment(store)
}
