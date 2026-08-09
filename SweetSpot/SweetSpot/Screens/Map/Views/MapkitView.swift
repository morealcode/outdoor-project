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
