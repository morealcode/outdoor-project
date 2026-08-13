//
//  HomeView.swift
//  SweetSpot
//
//  Created by Guillaume Richard on 11/08/2026.
//

import SwiftUI

struct HomeView: View {
    @Environment(AppStore.self) private var store

    @State private var showNewEvent = false

    private var upcomingGroups: [MeetupGroup] {
        store.groups
            .filter { $0.event.date >= Date.now }
            .sorted { $0.event.date < $1.event.date }
    }

    private var pastGroups: [MeetupGroup] {
        store.groups
            .filter { $0.event.date < Date.now }
            .sorted { $0.event.date > $1.event.date }
    }

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                header

                upcomingSection

                pastSection

                PrimaryButton(
                    title: "Créer un événement",
                    systemImage: "plus.circle"
                ) {
                    showNewEvent = true
                }
            }
            .padding()
        }
        .background(.backgroundApp)
        .navigationDestination(
            isPresented: $showNewEvent
        ) {
            NewEventView()
        }
    }
}

// MARK: - Header

extension HomeView {

    fileprivate var header: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            LabelUIKitRepresentable(
                text: "Bienvenue"
            )
            .frame(height: 42)

            Text(store.currentUser.name)
                .font(.title)
                .fontWeight(.medium)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

// MARK: - Upcoming

extension HomeView {

    @ViewBuilder
    fileprivate var upcomingSection: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {

            Text("À venir")
                .font(.title2)
                .fontWeight(.bold)

            if upcomingGroups.isEmpty {

                Text(
                    "Vous n'avez pas encore d'événement à venir."
                )
                .foregroundStyle(.secondary)

            } else {

                ForEach(upcomingGroups) { group in
                    NavigationLink {
                        GroupView(
                            store: store,
                            groupID: group.id
                        )
                    } label: {
                        EventCardHome(
                            group: group
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Past

extension HomeView {

    @ViewBuilder
    fileprivate var pastSection: some View {

        if !pastGroups.isEmpty {

            VStack(
                alignment: .leading,
                spacing: 12
            ) {

                Text("Passés")
                    .font(.title2)
                    .fontWeight(.bold)

                ForEach(pastGroups) { group in
                    NavigationLink {
                        GroupView(
                            store: store,
                            groupID: group.id
                        )
                    } label: {
                        EventCardHome(
                            group: group
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Event Card

struct EventCardHome: View {

    let group: MeetupGroup

    private var event: MeetupEvent {
        group.event
    }

    private var isPast: Bool {
        event.date < Date.now
    }

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            HStack {

                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {

                    Text(event.name)
                        .font(.headline)

                    Text(group.name)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text(
                    isPast
                        ? "Passé"
                        : "À venir"
                )
                .font(.caption.bold())
                .foregroundStyle(
                    isPast
                        ? .secondary
                        : Color.green
                )
            }

            HStack(spacing: 6) {

                Image(
                    systemName: "calendar"
                )

                Text(
                    event.date.formatted(
                        date: .abbreviated,
                        time: .shortened
                    )
                )
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)

            if let place = finalPlace {

                HStack(spacing: 6) {

                    Image(
                        systemName: "mappin.and.ellipse"
                    )

                    Text(place.name)
                }
                .font(.subheadline)
            }

            HStack(spacing: 6) {

                Image(
                    systemName: "person.2"
                )

                Text(
                    "\(group.participants.count) participants"
                )
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding()
        .background(
            .white,
            in: RoundedRectangle(
                cornerRadius: 18
            )
        )
        .shadow(
            color: .black.opacity(0.05),
            radius: 8,
            x: 0,
            y: 4
        )
    }

    private var finalPlace: Place? {

        guard
            let finalPlaceID = event.finalPlaceID
        else {
            return nil
        }

        return event.suggestedPlaces.first {
            $0.id.uuidString == finalPlaceID
        }
    }
}

// MARK: - UIKit Label

struct LabelUIKitRepresentable: UIViewRepresentable {

    let text: String

    func makeUIView(
        context: Context
    ) -> UILabel {

        let label = UILabel()

        label.text = text
        label.font = UIFont.boldSystemFont(
            ofSize: 35
        )

        return label
    }

    func updateUIView(
        _ uiView: UILabel,
        context: Context
    ) {
        uiView.text = text
    }
}

// MARK: - Preview

#Preview {
    HomeViewPreview()
}

private struct HomeViewPreview: View {

    @State private var store: AppStore?

    var body: some View {
        Group {

            if let store {

                NavigationStack {
                    HomeView()
                }
                .environment(store)

            } else {

                ProgressView(
                    "Chargement..."
                )
            }
        }
        .task {
            store = await MockDataV2.makeStore()
        }
    }
}
