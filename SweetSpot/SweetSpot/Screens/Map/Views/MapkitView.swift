//
//  MapkitView.swift
//  SweetSpot
//
//  Created by morealcode on 09/08/2026.
//

import MapKit
import SwiftUI

struct MapkitView: View {

    @Binding var cameraPosition: MapCameraPosition

    let participants: [Participant]
    let optimalPoint: CLLocationCoordinate2D

    var body: some View {
        Map(position: $cameraPosition) {

            ForEach(participants) { participant in

                if let location = participant.location {

                    MapPolyline(
                        coordinates: [
                            location.coordinate,
                            optimalPoint,
                        ]
                    )
                    .stroke(
                        .accent,
                        style: StrokeStyle(
                            lineWidth: 0.8,
                            lineCap: .round,
                            dash: [2, 4]
                        )
                    )

                    Annotation(
                        participant.name,
                        coordinate: location.coordinate
                    ) {
                        PersonMarkerView()
                    }
                }
            }

            Annotation(
                "Point optimal",
                coordinate: optimalPoint
            ) {
                OptimalMarkerView()
            }
        }
        .mapStyle(.standard)
    }
}

// MARK: - Preview

#Preview("MapkitView") {
    MapkitViewPreview()
}

private struct MapkitViewPreview: View {

    @State private var store: AppStore?

    var body: some View {
        Group {

            if let store,
                let group = store.groups.first
            {

                MapkitPreviewContent(
                    group: group
                )

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

private struct MapkitPreviewContent: View {

    let group: MeetupGroup

    @State private var cameraPosition: MapCameraPosition

    init(group: MeetupGroup) {

        self.group = group

        let center =
            group.event.meetingZone?.center
            ?? MeetupGroup.calculateCenter(
                of: group.participants
            )

        _cameraPosition = State(
            initialValue: .region(
                MKCoordinateRegion(
                    center: center.coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.03,
                        longitudeDelta: 0.03
                    )
                )
            )
        )
    }

    var body: some View {

        let optimalPoint =
            group.event.meetingZone?.center.coordinate
            ?? MeetupGroup
            .calculateCenter(
                of: group.participants
            )
            .coordinate

        MapkitView(
            cameraPosition: $cameraPosition,
            participants: group.participants,
            optimalPoint: optimalPoint
        )
    }
}
