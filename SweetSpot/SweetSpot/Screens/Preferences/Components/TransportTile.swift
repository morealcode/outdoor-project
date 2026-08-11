//
//  TransportTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct TransportTile: View {
    @Environment(AppStore.self) private var store

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    let iconTransport: String
    let nameTransport: String
    var selected: Bool

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: iconTransport)
            Text(nameTransport)
                .font(.caption)
        }
        .foregroundStyle(selected ? .black : .secondary.opacity(0.5))
        .frame(width: 80, height: 70)
        .background(
            selected ? .black : .secondary.opacity(0.5),
            in: .rect(cornerRadius: 12).stroke(lineWidth: 2)
        )
        .contentShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    TransportTile(
        iconTransport: "house.fill",
        nameTransport: "Transports",
        selected: true
    )
}
