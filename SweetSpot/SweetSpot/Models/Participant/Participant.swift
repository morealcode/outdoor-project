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

    var response: ParticipantResponse
    var hasVoted: Bool
    var locationVoted: UUID?
}

extension Participant {

    static let mock = Participant(
        name: "Ambre",
        location: GeoPoint(
            latitude: 48.8600,
            longitude: 2.3470
        ),
        transportMode: .transport,
        travelTime: 18 * 60,
        response: .attending,
        hasVoted: true
    )

    static let mockWalking = Participant(
        name: "Chloé",
        location: GeoPoint(
            latitude: 48.8608,
            longitude: 2.3445
        ),
        transportMode: .walking,
        travelTime: 12 * 60,
        response: .attending,
        hasVoted: false
    )

    static let mockBicycle = Participant(
        name: "Lucas",
        location: GeoPoint(
            latitude: 48.8615,
            longitude: 2.3490
        ),
        transportMode: .bicycle,
        travelTime: 15 * 60,
        response: .pending,
        hasVoted: false
    )

    static let mockCar = Participant(
        name: "Julie",
        location: GeoPoint(
            latitude: 48.8590,
            longitude: 2.3490
        ),
        transportMode: .car,
        travelTime: 15 * 60,
        response: .maybe,
        hasVoted: false
    )
}
