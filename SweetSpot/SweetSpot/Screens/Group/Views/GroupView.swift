//
//  GroupView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct GroupView: View {
    @State private var viewModel: GroupViewModel

    init(
        store: AppStore,
        groupID: UUID
    ) {
        _viewModel = State(
            initialValue: GroupViewModel(
                store: store,
                groupID: groupID
            )
        )
    }

    var body: some View {
        Group {
            if let group = viewModel.group {
                List {
                    Section("Événement") {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(group.event.name)
                                .font(.headline)

                            Text(
                                group.event.date.formatted(
                                    date: .long,
                                    time: .shortened
                                )
                            )
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        }
                    }

                    Section("Participants") {
                        ForEach(viewModel.participants) { participant in
                            HStack(spacing: 12) {
                                Image(
                                    systemName: participant
                                        .transportMode
                                        .systemImage
                                )
                                .frame(width: 24)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(participant.name)
                                        .font(.body)

                                    Text(participant.transportMode.rawValue)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                if let travelTime = participant.travelTime {
                                    Text("\(Int(travelTime / 60)) min")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
                .navigationTitle(group.name)
            } else {
                ContentUnavailableView(
                    "Groupe introuvable",
                    systemImage: "person.3.fill",
                    description: Text(
                        "Ce groupe n’existe pas dans le store."
                    )
                )
            }
        }
    }
}

#Preview {
    let store = MockData.makeStore()

    NavigationStack {
        GroupView(
            store: store,
            groupID: store.groups.first!.id
        )
    }
    .environment(store)
}
