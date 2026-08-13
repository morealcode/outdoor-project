//
//  SummaryView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct SummaryView: View {

    let group: MeetupGroup

    @State private var showMeetingZone = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                DestinationRow()

                VoteRow()

                AttendeesRow()

                PrimaryButton(
                    title: "Voir la zone de rendez-vous",
                    systemImage: "map"
                ) {
                    showMeetingZone = true
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(.backgroundApp)
        .navigationDestination(
            isPresented: $showMeetingZone
        ) {
            MeetingZoneView(
                group: group
            )
        }
    }
}

#Preview("SummaryView") {
    SummaryViewPreview()
}

private struct SummaryViewPreview: View {

    @State private var store: AppStore?

    var body: some View {
        Group {
            if let store,
                let group = store.groups.first
            {

                NavigationStack {
                    SummaryView(
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
