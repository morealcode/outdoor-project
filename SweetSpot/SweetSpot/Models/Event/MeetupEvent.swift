//
//  Event.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct MeetupEvent: Identifiable {
    let id: UUID = UUID()

    var name: String
    var date: Date
    
    var invitationLink: String

    var meetingZone: MeetingZone?
    var suggestedPlaces: [Place]

    // participantID : placeID
    var votes: [UUID: UUID]

    var finalPlaceID: String?
}
