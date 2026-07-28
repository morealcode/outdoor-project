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

    var participants: [Participant] {
        group?.participants ?? []
    }
}
