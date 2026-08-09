//
//  MapView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import MapKit
import SwiftUI

struct MeetingZoneView: View {

    private let optimalPoint = CLLocationCoordinate2D(
        latitude: 48.8656,
        longitude: 2.3410
    )

    @State private var cameraPosition: MapCameraPosition

    private let participants: [Participant] = [
        Participant(
            name: "Alice",
            location: GeoPoint(
                latitude: 48.8750,
                longitude: 2.3350
            ),
            transportMode: .walking,
            travelTime: 18 * 60,
            response: .attending,
            hasVoted: true
        ),

        Participant(
            name: "Thomas",
            location: GeoPoint(
                latitude: 48.8740,
                longitude: 2.3560
            ),
            transportMode: .bus,
            travelTime: 22 * 60,
            response: .attending,
            hasVoted: true
        ),

        Participant(
            name: "Julie",
            location: GeoPoint(
                latitude: 48.8660,
                longitude: 2.3250
            ),
            transportMode: .car,
            travelTime: 15 * 60,
            response: .maybe,
            hasVoted: false
        ),

        Participant(
            name: "Lucas",
            location: GeoPoint(
                latitude: 48.8580,
                longitude: 2.3520
            ),
            transportMode: .bicycle,
            travelTime: 20 * 60,
            response: .pending,
            hasVoted: true
        ),
    ]

    init() {
        let optimalPoint = CLLocationCoordinate2D(
            latitude: 48.8656,
            longitude: 2.3410
        )

        let mapCenter = CLLocationCoordinate2D(
            latitude: optimalPoint.latitude - 0.008,
            longitude: optimalPoint.longitude
        )

        _cameraPosition = State(
            initialValue: .region(
                MKCoordinateRegion(
                    center: mapCenter,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.035,
                        longitudeDelta: 0.035
                    )
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

            MapCardView()
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: - Header

struct MeetingZoneHeaderView: View {

    var body: some View {
        HStack(spacing: 16) {

            // Peut-être pas nécessaire puisqu'il y a un bouton dans navigationstack par défaut
            // MeetingZoneBackButton()

            MeetingZoneHeaderTitle()

            Spacer()

        }
        .padding()
    }
}

// MARK: - Back Button

struct MeetingZoneBackButton: View {

    var body: some View {
        Button {
            print("Retour")
        } label: {
            Image(systemName: "chevron.left")
                .font(.title3.bold())
                .foregroundStyle(.primary)
                .frame(width: 50, height: 50)
                .background(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .shadow(
                    color: .black.opacity(0.08),
                    radius: 8
                )
        }
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

// MARK: - Filter Button

struct MeetingZoneFilterButton: View {

    var body: some View {
        Button {
            print("Filtres")
        } label: {
            Label(
                "Filtres",
                systemImage: "slider.horizontal.3"
            )
            .font(.headline)
            .foregroundStyle(.indigo)
            .padding()
            .background(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 16)
            )
        }
    }
}

// MARK: - Preview
#Preview {
    MeetingZoneView()
}
