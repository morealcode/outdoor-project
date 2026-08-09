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

                    // Ligne vers le point optimal
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

#Preview {
    @Previewable @State var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 48.8610,
                longitude: 2.3550
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.035,
                longitudeDelta: 0.035
            )
        )
    )
    let group = MockData.makeDinnerGroup()
    
    let optimalPoint = CLLocationCoordinate2D(
        latitude: 48.8610,
        longitude: 2.3550
    )
    
    MapkitView(
        cameraPosition: $cameraPosition,
        participants: group.participants,
        optimalPoint: optimalPoint
    )
}
