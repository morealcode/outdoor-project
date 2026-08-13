//
//  GroupList.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct GroupList: View {

    @Environment(AppStore.self) private var store
    
    private var activeGroups: [MeetupGroup] {
            store.groups
                .filter { $0.event.date >= Date.now }
                .sorted { $0.event.date < $1.event.date }
        }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                if activeGroups.isEmpty {
                    emptyState
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(store.groups) { group in
                                NavigationLink {
                                    GroupView(
                                        store: store,
                                        groupID: group.id
                                    )
                                } label: {
                                    GroupCard(group: group)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        .padding(.bottom, 24)
                    }
                }
            }
            .navigationTitle("Mes groupes")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

private struct GroupCard: View {

    let group: MeetupGroup

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // Header
            HStack(alignment: .top, spacing: 12) {

                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.accent.opacity(0.12))
                        .frame(width: 46, height: 46)

                    Image(systemName: "person.3.fill")
                        .font(.system(size: 19, weight: .semibold))
                        .foregroundStyle(Color.accent)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(group.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(1)

                    Text(group.event.name)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.tertiary)
                    .padding(.top, 4)
            }

            Divider()

            // Informations
            HStack(spacing: 0) {

                GroupInfoItem(
                    systemImage: "calendar",
                    title: "Événement",
                    value: group.event.date.formatted(
                        .dateTime
                            .day()
                            .month(.abbreviated)
                    )
                )

                Spacer()

                GroupInfoItem(
                    systemImage: "person.2.fill",
                    title: "Participants",
                    value: "\(group.participants.count)"
                )
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.secondarySystemGroupedBackground))
        )
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(
                    Color.primary.opacity(0.05),
                    lineWidth: 1
                )
        }
    }
}

private struct GroupInfoItem: View {

    let systemImage: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 8) {

            Image(systemName: systemImage)
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Color.accent)

            VStack(alignment: .leading, spacing: 2) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(value)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.primary)
            }
        }
    }
}

private extension GroupList {

    var emptyState: some View {
        VStack(spacing: 20) {

            ZStack {
                Circle()
                    .fill(Color.accent.opacity(0.12))
                    .frame(width: 82, height: 82)

                Image(systemName: "person.3.fill")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundStyle(Color.accent)
            }

            VStack(spacing: 8) {

                Text("Aucun groupe")
                    .font(.title3.weight(.semibold))

                Text(
                    "Créez ou rejoignez un groupe pour commencer à organiser vos événements."
                )
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .padding(.horizontal, 30)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview("MockV1") {
    GroupList()
        .environment(MockData.makeStore())
}
