//
//  GroupViewModel.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation
import Observation

@Observable
final class GroupViewModel {
    private let store: AppStore
    private let groupID: UUID
    
    var id: UUID {
        groupID
    }

    init(
        store: AppStore,
        groupID: UUID
    ) {
        self.store = store
        self.groupID = groupID
    }

    var group: MeetupGroup? {
        store.groups.first {
            $0.id == groupID
        }
    }
    
    var event: MeetupEvent? {
        group?.event
    }

    var participants: [Participant] {
        group?.participants ?? []
    }
    
    var attendingCount: Int {
        participants.filter { $0.response == .attending }.count
    }
    
    var pendingCount: Int {
        participants.filter { $0.response == .pending }.count
    }
    
    var maybeCount: Int {
        participants.filter { $0.response == .maybe }.count
    }
    
    var unavailableCount: Int {
        participants.filter { $0.response == .unavailable }.count
    }
    
    var participantsToRemind: [Participant] {
        participants.filter {
            $0.response == .pending
            ||
            ($0.response != .unavailable && !$0.hasVoted)
        }
    }
    
    var invitationLink: String {
        event?.invitationLink ?? ""
    }
}
