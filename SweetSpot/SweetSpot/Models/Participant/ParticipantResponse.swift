//
//  ParticipantResponse.swift
//  SweetSpot
//
//  Created by apprenant120 on 29/07/2026.
//

import Foundation

enum ParticipantResponse: String, CaseIterable, Identifiable {
    
    case attending
    case pending
    case maybe
    case unavailable
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .attending:
            return "À répondu "
        case .pending:
            return "En attente"
        case .maybe:
            return "À voir"
        case .unavailable:
            return "Indisponible"
        }
    }
    
    var colorName: String {
        switch self {
        case .attending:
            return "Green"
        case .pending:
            return "Orange"
        case .maybe:
            return "Blue"
        case .unavailable:
            return "Red"
        }
    }
    
    var systemImage: String {
        switch self {
        case .attending:
            return "checkmark.circle.fill"
        case .pending:
            return "clock.fill"
        case .maybe:
            return "eye.fill"
        case .unavailable:
            return "minus.circle.fill"
        }
    }
}
