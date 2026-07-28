//
//  GroupList.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct GroupList: View {
    @Environment(AppStore.self) private var store

    var body: some View {
        NavigationStack {
            List {
                ForEach(store.groups) { group in
                    NavigationLink {
                        GroupView(
                            store: store,
                            groupID: group.id
                        )
                    } label: {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(group.name)
                                .font(.headline)

                            Text(group.event.name)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            HStack(spacing: 6) {
                                Image(systemName: "person.3.fill")

                                Text(
                                    "\(group.participants.count) participants"
                                )
                            }
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Mes groupes")
            .overlay {
                if store.groups.isEmpty {
                    ContentUnavailableView(
                        "Aucun groupe",
                        systemImage: "person.3",
                        description: Text(
                            "Créez ou rejoignez un groupe pour commencer."
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    GroupList()
        .environment(MockData.makeStore())
}
