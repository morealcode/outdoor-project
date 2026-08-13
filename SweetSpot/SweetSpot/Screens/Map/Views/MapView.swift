//
//  MapView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import MapKit
import SwiftUI

struct MeetingZoneView: View {

    let group: MeetupGroup

    @State private var cameraPosition: MapCameraPosition

    // MARK: - Participants

    private var participants: [Participant] {
        group.participants
    }

    // MARK: - Optimal Point

    private var optimalPoint: CLLocationCoordinate2D {

        if let center = group.event.meetingZone?.center {
            return center.coordinate
        }

        return
            MeetupGroup
            .calculateCenter(
                of: participants
            )
            .coordinate
    }

    // MARK: - Init

    init(group: MeetupGroup) {

        self.group = group

        let participants = group.participants

        let optimalPoint: CLLocationCoordinate2D

        if let center = group.event.meetingZone?.center {

            optimalPoint = center.coordinate

        } else {

            optimalPoint =
                MeetupGroup
                .calculateCenter(
                    of: participants
                )
                .coordinate
        }

        // Toutes les coordonnées disponibles
        let participantCoordinates =
            participants.compactMap {
                $0.location?.coordinate
            }

        let allCoordinates =
            participantCoordinates
            + [optimalPoint]

        // Centre réel de toutes les coordonnées
        let mapCenter: CLLocationCoordinate2D

        if allCoordinates.isEmpty {

            mapCenter = optimalPoint

        } else {

            let latitude =
                allCoordinates
                .map(\.latitude)
                .reduce(0, +)
                / Double(allCoordinates.count)

            let longitude =
                allCoordinates
                .map(\.longitude)
                .reduce(0, +)
                / Double(allCoordinates.count)

            mapCenter = CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            )
        }

        // MARK: - Span dynamique

        let latitudes =
            allCoordinates.map(\.latitude)

        let longitudes =
            allCoordinates.map(\.longitude)

        let latitudeDelta =
            (latitudes.max() ?? mapCenter.latitude)
            - (latitudes.min() ?? mapCenter.latitude)

        let longitudeDelta =
            (longitudes.max() ?? mapCenter.longitude)
            - (longitudes.min() ?? mapCenter.longitude)

        // Petite marge pour ne pas coller les pins aux bords
        let span = MKCoordinateSpan(
            latitudeDelta: max(
                latitudeDelta * 1.8,
                0.015
            ),
            longitudeDelta: max(
                longitudeDelta * 1.8,
                0.015
            )
        )

        _cameraPosition = State(
            initialValue: .region(
                MKCoordinateRegion(
                    center: mapCenter,
                    span: span
                )
            )
        )
    }

    var body: some View {
        ZStack(alignment: .bottom) {

            VStack(spacing: 0) {

                MeetingZoneHeaderView()

                MapkitView(
                    cameraPosition: $cameraPosition,
                    participants: participants,
                    optimalPoint: optimalPoint
                )
            }

            MapCardView(
                participants: participants
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 100)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: - Header

struct MeetingZoneHeaderView: View {

    var body: some View {
        HStack(spacing: 16) {

            MeetingZoneHeaderTitle()

            Spacer()
        }
        .padding()
    }
}

// MARK: - Header Title

struct MeetingZoneHeaderTitle: View {

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            Text("Zone de rendez-vous")
                .font(.title2.bold())

            Text(
                "Nous avons calculé le meilleur point pour vous retrouver."
            )
            .font(.footnote)
            .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Preview

#Preview("MeetingZoneView") {
    MeetingZoneViewPreview()
}

private struct MeetingZoneViewPreview: View {

    @State private var store: AppStore?

    var body: some View {
        Group {

            if let store,
                let group = store.groups.first
            {

                NavigationStack {
                    MeetingZoneView(
                        group: group
                    )
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
