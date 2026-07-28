//
//  Participant.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct Participant: Identifiable {
    let id: UUID = UUID()

    var name: String
    var location: GeoPoint?
    var transportMode: TransportMode
    var travelTime: TimeInterval?

    var hasVoted: Bool
}
