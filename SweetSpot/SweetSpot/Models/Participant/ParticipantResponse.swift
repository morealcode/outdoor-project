//
//  ParticipantResponse.swift
//  SweetSpot
//
//  Created by apprenant120 on 29/07/2026.
//

import Foundation
import SwiftUI

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
    
    var colorName: Color {
        switch self {
        case .attending:
            return Color(.accentGreen)
        case .pending:
            return Color(.accentOrange)
        case .maybe:
            return Color(.accentBlue)
        case .unavailable:
            return Color(.red)
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
