//
//  Group.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

struct MeetupGroup: Identifiable {
    let id: UUID = UUID()

    var name: String
    var invitationCode: String

    var participants: [Participant]

    // Événement associé à ce groupe
    var event: MeetupEvent
}
