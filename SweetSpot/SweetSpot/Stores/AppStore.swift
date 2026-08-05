//
//  AppStore.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation
import Observation

@Observable
final class AppStore {

    // Utilisateur connecté
    var currentUser: User

    // Tous les groupes auxquels l’utilisateur appartient
    var groups: [MeetupGroup]

    init(
        currentUser: User,
        groups: [MeetupGroup] = [],
    ) {
        self.currentUser = currentUser
        self.groups = groups
    }
}

extension AppStore {
    
    func createEvent(_ event: MeetupEvent, for groupID: UUID) {
        guard let index = groups.firstIndex(where: {
            $0.id == groupID
        }) else {
            return
        }
        
        groups[index].event = event
    }
    
    func updateEvent(_ event: MeetupEvent, for groupID: UUID) {
        guard let index = groups.firstIndex(where: {
            $0.id == groupID
        }) else {
            return
        }
        
        groups[index].event = event
    }
}
