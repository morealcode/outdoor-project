//
//  PlaceCategory.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

enum PlaceCategory: String, CaseIterable, Identifiable {
    case sushi = "Sushi"
    case bar = "Bar"
    case asian = "Asian"
    case italian = "Italian"
    case indian = "Indian"
    case french = "French"
    case cafe = "Cafe"
    case fastFood = "Fast Food"
    case park = "Park"
    case activity = "Activity"

    var id: Self { self }

    var systemImage: String {
        switch self {
        case .sushi:
            return "fish.fill"
        case .bar:
            return "wineglass.fill"
        case .asian:
            return "takeoutbag.and.cup.and.straw.fill"
        case .italian:
            return "fork.knife"
        case .indian:
            return "flame.fill"
        case .french:
            return "fork.knife"
        case .cafe:
            return "cup.and.saucer.fill"
        case .fastFood:
            return "takeoutbag.and.cup.and.straw.fill"
        case .park:
            return "tree.fill"
        case .activity:
            return "figure.run"
        }
    }
}
