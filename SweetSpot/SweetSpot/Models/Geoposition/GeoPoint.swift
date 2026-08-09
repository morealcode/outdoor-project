//
//  GeoPoint.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation
import MapKit

struct GeoPoint: Equatable {
    var latitude: Double
    var longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
