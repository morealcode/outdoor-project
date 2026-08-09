//
//  ZoneCardView.swift
//  SweetSpot
//
//  Created by morealcode on 29/07/2026.
//

import SwiftUI

struct MapCardView: View {

    var body: some View {
        VStack(spacing: 16) {
            MeetingZoneCardHeader()
            MeetingZoneStats()
            MeetingZoneDescription()
            MeetingZoneMainButton()
        }
        .padding(16)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
        .shadow(color: .black.opacity(0.25), radius: 12, x: 0, y: 0)
    }
}

// MARK: - Header

struct MeetingZoneCardHeader: View {

    var body: some View {
        HStack(spacing: 12) {

            Image(systemName: "mappin.and.ellipse")
                .font(.title2)
                .padding()
                .background(
                    Color(red: 0.02, green: 0.56, blue: 0.62).opacity(0.08)
                )
                .cornerRadius(16)
                .foregroundStyle(.accentGreen)

            VStack(alignment: .leading, spacing: 5) {

                Text("Zone optimale")
                    .font(.title3.bold())

                Text("Place des Victoires, 75002 Paris")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }
}

// MARK: - Stats

struct MeetingZoneStats: View {

    var body: some View {
        HStack {

            StatView(
                icon: "clock",
                title: "Temps moyen",
                value: "18 min"
            )

            Divider()
                .frame(height: 50)

            StatView(
                icon: "car",
                title: "Trajet moyen",
                value: "4,2 km"
            )

            Divider()
                .frame(height: 50)

            StatView(
                icon: "person.2",
                title: "Participants",
                value: "12"
            )
        }
    }
}

// MARK: - Description

struct MeetingZoneDescription: View {

    var body: some View {
        HStack(spacing: 14) {

            Image(systemName: "sparkles")
                .font(.title3)
                .foregroundStyle(.teal)

            Text(
                "Ce point minimise le temps de trajet total pour tout le groupe."
            )
            .font(.caption)

            Spacer()
        }
        .padding()
        .background(.cyan.opacity(0.08))
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
    }
}

// MARK: - Main Button

struct MeetingZoneMainButton: View {

    var body: some View {
        Button {
            print("Utiliser ce point")
        } label: {

            Label(
                "Utiliser ce point de rendez-vous",
                systemImage: "paperplane"
            )
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(
                LinearGradient(
                    colors: [.accent, .accentBlue],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .shadow(color: .black.opacity(0.25), radius: 12, x: 0, y: 0)
        }
    }
}

// MARK: - Preview

#Preview {
    MapCardView()
        .padding()
        .background(.gray.opacity(0.2))
}
