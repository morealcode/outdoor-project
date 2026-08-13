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

    private let store: AppStore
    private let groupID: UUID?

    var isEditing: Bool {
        groupID != nil
    }

    var isFormValid: Bool {
        !eventName
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .isEmpty
    }

    init(
        store: AppStore,
        groupID: UUID? = nil
    ) {
        self.store = store
        self.groupID = groupID

        if let groupID,
            let group = store.groups.first(where: { $0.id == groupID })
        {

            eventName = group.event.name
            selectedDate = group.event.date
            invitationLink = group.event.invitationLink

        } else {
            generateInvitationLink()
        }
    }

    private func generateInvitationLink() {
        let code = UUID()
            .uuidString
            .prefix(8)
            .uppercased()

        invitationLink =
            "https://sweetspot.app/join/\(code)"
    }

    func save() {
        if let groupID {
            updateExistingGroup(groupID: groupID)
        } else {
            createNewGroup()
        }
    }

    // MARK: - Create

    private func createNewGroup() {

        let currentParticipant = Participant(
            name: store.currentUser.name,
            location: nil,
            transportMode: .transport,
            travelTime: 20 * 60,
            response: .attending,
            hasVoted: false
        )

        let event = MeetupEvent(
            name: eventName,
            date: selectedDate,
            invitationLink: invitationLink,
            meetingZone: nil,
            suggestedPlaces: [],
            votes: [:],
            finalPlaceID: nil
        )

        let group = MeetupGroup(
            name: eventName,
            participants: [
                currentParticipant
            ],
            event: event
        )

        store.groups.append(group)
    }

    // MARK: - Update

    private func updateExistingGroup(
        groupID: UUID
    ) {
        guard
            let index = store.groups.firstIndex(
                where: { $0.id == groupID }
            )
        else {
            return
        }

        store.groups[index].event.name =
            eventName

        store.groups[index].event.date =
            selectedDate

        store.groups[index].event.invitationLink =
            invitationLink

    }
}
