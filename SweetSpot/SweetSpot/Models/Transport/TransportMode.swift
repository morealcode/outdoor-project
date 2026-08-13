//
//  TransportMode.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation
import MapKit

enum TransportMode: String, CaseIterable, Identifiable {
    case car = "Car"
    case bicycle = "Bicycle"
    case transport = "Transport"
    case walking = "Walking"

    var id: Self { self }

    var systemImage: String {
        switch self {
        case .car:
            return "car.fill"
        case .bicycle:
            return "bicycle"
        case .transport:
            return "bus.fill"
        case .walking:
            return "figure.walk"
        }
    }
}

extension TransportMode {

    var mapKitTransportType: MKDirectionsTransportType {
        switch self {
        case .bicycle:
            return .cycling
        
        case .car:
            return .automobile

        case .walking:
            return .walking

        case .transport:
            return .transit
        }
    }
}
