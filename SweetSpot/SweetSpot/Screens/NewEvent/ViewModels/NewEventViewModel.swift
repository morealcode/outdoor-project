//
//  NewEventViewModel.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation
import Observation

@Observable
final class NewEventViewModel {
    
    var eventName: String = ""
    var selectedDate: Date = .now
    var invitationLink: String = ""
    
    var isFormValid: Bool {
        !eventName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init() {
        generateInvitationLink()
    }
    
    func generateInvitationLink() {
        let code = UUID()
            .uuidString
            .prefix(8)
            .uppercased()
        
        invitationLink = "https://sweetspot.app/join/\(code)"
    }
    
    func createEvent() -> MeetupEvent {
        MeetupEvent(
            name: eventName,
            date: selectedDate,
            invitationLink: invitationLink,
            meetingZone: nil,
            suggestedPlaces: [],
            votes: [:],
            finalPlaceID: nil
        )
    }
}
