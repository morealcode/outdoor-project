//
//  Place.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct Place: Identifiable {
    let id: UUID = UUID()

    var name: String
    var address: String
    var location: GeoPoint

    var category: PlaceCategory

    var imageName: String
    var matchPercentage: Int
    var matchColor: Color
    let rating: Double
    var reviewCount: Int
    var duration: String
    var priceRange: String
    var tag: String
    var tagColor: Color
    var isSelected: Bool = false

    init(
        name: String,
        address: String,
        location: GeoPoint
    ) {
        self.name = name
        self.address = address
        self.location = location

        // Category
        self.category =
            [
                PlaceCategory.sushi,
                .bar,
                .italian,
                .indian,
                .french,
                .cafe,
                .fastFood,
            ].randomElement() ?? .french

        // Image
        self.imageName =
            [
                "koutoubia",
                "grandpalais",
                "jemaaelfna",
                "louvre",
                "orsay",
                "souk",
                "toureiffel",
            ].randomElement() ?? "louvre"

        // Match
        self.matchPercentage = Int.random(
            in: 50...95
        )

        self.matchColor =
            [
                Color.purple,
                .orange,
                .green,
                .blue,
                .teal,
            ].randomElement() ?? .purple

        // Rating
        self.rating = Double.random(
            in: 2.5...4.5
        )

        // Reviews
        self.reviewCount = Int.random(
            in: 20...100
        )

        // Duration
        let randomDuration = Int.random(
            in: 2...20
        )

        self.duration = "\(randomDuration) min"

        // Price
        let minPrice = Int.random(
            in: 10...40
        )

        let maxPrice = Int.random(
            in: (minPrice + 10)...100
        )

        self.priceRange =
            "\(minPrice)–\(maxPrice) € /pers."

        // Tag
        self.tag =
            [
                "Privatisable",
                "Cocktails",
                "Végétarien",
                "Terrasse",
            ].randomElement() ?? "Privatisable"

        self.tagColor =
            [
                Color.purple,
                .orange,
                .green,
                .teal,
                .blue,
            ].randomElement() ?? .teal
    }
    
    // Init pour le mock
    init(
            name: String,
            address: String,
            location: GeoPoint,
            category: PlaceCategory,
            imageName: String,
            matchPercentage: Int,
            matchColor: Color,
            rating: Double,
            reviewCount: Int,
            duration: String,
            priceRange: String,
            tag: String,
            tagColor: Color,
            isSelected: Bool = false
        ) {
            self.name = name
            self.address = address
            self.location = location
            self.category = category
            self.imageName = imageName
            self.matchPercentage = matchPercentage
            self.matchColor = matchColor
            self.rating = rating
            self.reviewCount = reviewCount
            self.duration = duration
            self.priceRange = priceRange
            self.tag = tag
            self.tagColor = tagColor
            self.isSelected = isSelected
        }

}

extension Place {

    static let mock = Place(
        name: "Le Café Marly",
        address: "93 Rue de Rivoli, 75001 Paris",
        location: GeoPoint(
            latitude: 48.8620071,
            longitude: 2.3357451
        ),
        category: .french,
        imageName: "louvre",
        matchPercentage: 87,
        matchColor: .green,
        rating: 4.3,
        reviewCount: 76,
        duration: "9 min",
        priceRange: "25–45 € /pers.",
        tag: "Terrasse",
        tagColor: .teal
    )

    static let mockBar = Place(
        name: "Central Bar",
        address: "8 rue de Bretagne, Paris",
        location: GeoPoint(
            latitude: 48.8630,
            longitude: 2.3600
        ),
        category: .bar,
        imageName: "grandpalais",
        matchPercentage: 72,
        matchColor: .orange,
        rating: 3.9,
        reviewCount: 54,
        duration: "14 min",
        priceRange: "18–35 € /pers.",
        tag: "Cocktails",
        tagColor: .purple
    )
}
