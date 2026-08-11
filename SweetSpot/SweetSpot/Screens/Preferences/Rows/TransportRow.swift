//
//  TransportRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct TransportRow: View {
    @Environment(AppStore.self) private var store

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    var body: some View {
        VStack {
            HStack {
                Text("Transport préféré")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 20) {
                Button {
                    preferencesViewModel.changeFavoriteTransport(.transport)
                } label: {
                    TransportTile(

                        iconTransport: "tram.fill",
                        nameTransport: "Transport",
                        selected: preferencesViewModel.isTransportSelected(
                            transport: .transport
                        )
                    )
                }

                Button {
                    preferencesViewModel.changeFavoriteTransport(.car)

                } label: {
                    TransportTile(
                        iconTransport: "car.fill",
                        nameTransport: "Voiture",
                        selected: preferencesViewModel.isTransportSelected(
                            transport: .car
                        )
                    )

                }

                Button {
                    preferencesViewModel.changeFavoriteTransport(.bicycle)

                } label: {
                    TransportTile(
                        iconTransport: "bicycle",
                        nameTransport: "Vélo",
                        selected: preferencesViewModel.isTransportSelected(
                            transport: .bicycle
                        )
                    )

                }

                Button {
                    preferencesViewModel.changeFavoriteTransport(.walking)
                } label: {
                    TransportTile(
                        iconTransport: "figure.walk",
                        nameTransport: "À pieds",
                        selected: preferencesViewModel.isTransportSelected(
                            transport: .walking
                        )
                    )
                }

            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    let store = MockData.makeStore()
    TransportRow()
        .environment(store)
}

#Preview {
    let store = MockData.makeStore()
    PreferencesView()
        .environment(store)
}
