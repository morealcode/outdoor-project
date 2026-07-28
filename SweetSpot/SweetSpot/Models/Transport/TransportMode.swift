//
//  TransportMode.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

enum TransportMode: String, CaseIterable, Identifiable {
    case car = "Car"
    case bicycle = "Bicycle"
    case bus = "Bus"
    case subway = "Subway"

    var id: Self { self }

    var systemImage: String {
        switch self {
        case .car:
            return "car.fill"
        case .bicycle:
            return "bicycle"
        case .bus:
            return "bus.fill"
        case .subway:
            return "tram.fill"
        }
    }
}
