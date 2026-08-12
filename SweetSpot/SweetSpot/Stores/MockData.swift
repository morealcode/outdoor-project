//
//  MockData.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

enum MockData {

    // Store complet
    static func makeStore() -> AppStore {
        let currentUser = User(
            name: "Ambre",
            preferences: UserPreferences()
        )

        return AppStore(
            currentUser: currentUser,
            groups: [
                makeProjectGroup(),
                makeFriendsGroup(),
                makeDinnerGroup(),
            ]
        )
    }

    // Groupe projet iOS
    static func makeProjectGroup() -> MeetupGroup {
        let ambre = Participant(
            name: "Ambre",
            location: GeoPoint(
                latitude: 48.8566,
                longitude: 2.3522
            ),
            transportMode: .subway,
            travelTime: 18 * 60,
            response: .attending,
            hasVoted: true
        )

        let lucas = Participant(
            name: "Lucas",
            location: GeoPoint(
                latitude: 48.8757,
                longitude: 2.3590
            ),
            transportMode: .bicycle,
            travelTime: 15 * 60,
            response: .pending,
            hasVoted: false
        )
        
        let chloe = Participant(
            name: "Chloé",
            location: GeoPoint(
                latitude: 48.8584,
                longitude: 2.3470
            ),
            transportMode: .walking,
            travelTime: 12 * 60,
            response: .attending,
            hasVoted: false
        )

        let maxime = Participant(
            name: "Maxime",
            location: GeoPoint(
                latitude: 48.8695,
                longitude: 2.3525
            ),
            transportMode: .bicycle,
            travelTime: 10 * 60,
            response: .unavailable,
            hasVoted: false
        )

        let clara = Participant(
            name: "Clara",
            location: GeoPoint(
                latitude: 48.8518,
                longitude: 2.3585
            ),
            transportMode: .bus,
            travelTime: 20 * 60,
            response: .maybe,
            hasVoted: false
        )

        let hugo = Participant(
            name: "Hugo",
            location: GeoPoint(
                latitude: 48.8780,
                longitude: 2.3650
            ),
            transportMode: .car,
            travelTime: 14 * 60,
            response: .pending,
            hasVoted: false
        )

        let lea = Participant(
            name: "Léa",
            location: GeoPoint(
                latitude: 48.8645,
                longitude: 2.3445
            ),
            transportMode: .subway,
            travelTime: 16 * 60,
            response: .attending,
            hasVoted: false
        )

        let nathan = Participant(
            name: "Nathan",
            location: GeoPoint(
                latitude: 48.8465,
                longitude: 2.3505
            ),
            transportMode: .bicycle,
            travelTime: 13 * 60,
            response: .unavailable,
            hasVoted: false
        )

        let emma = Participant(
            name: "Emma",
            location: GeoPoint(
                latitude: 48.8705,
                longitude: 2.3380
            ),
            transportMode: .walking,
            travelTime: 9 * 60,
            response: .attending,
            hasVoted: false
        )

        let theo = Participant(
            name: "Théo",
            location: GeoPoint(
                latitude: 48.8600,
                longitude: 2.3690
            ),
            transportMode: .bus,
            travelTime: 17 * 60,
            response: .maybe,
            hasVoted: false
        )

        let sushiPlace = Place(
            name: "Sushi One",
            address: "12 rue du Temple, Paris",
            location: GeoPoint(
                latitude: 48.8615,
                longitude: 2.3540
            ),
            category: .sushi,
            rating: 4.6,
            priceLevel: 2,
        )

        let barPlace = Place(
            name: "Central Bar",
            address: "8 rue de Bretagne, Paris",
            location: GeoPoint(
                latitude: 48.8630,
                longitude: 2.3600
            ),
            category: .bar,
            rating: 4.3,
            priceLevel: 2,
        )

        let event = MeetupEvent(
            name: "Déjeuner de groupe",
            date: Date.now.addingTimeInterval(86_400),
            invitationLink: "https://sweetspot.app/join/DIN2026A",
            meetingZone: MeetingZone(
                center: GeoPoint(
                    latitude: 48.8610,
                    longitude: 2.3550
                ),
                polygon: [
                    GeoPoint(latitude: 48.8570, longitude: 2.3480),
                    GeoPoint(latitude: 48.8650, longitude: 2.3480),
                    GeoPoint(latitude: 48.8650, longitude: 2.3620),
                    GeoPoint(latitude: 48.8570, longitude: 2.3620),
                ]
            ),
            suggestedPlaces: [
                sushiPlace,
                barPlace,
            ],
            votes: [
                ambre.id: sushiPlace.id
            ],
            finalPlaceID: nil,
        )

        return MeetupGroup(
            name: "Diner potin",
//            invitationCode: "DIN2026",
            participants: [
                ambre,
                lucas,
                chloe,
                maxime,
                clara,
                hugo,
                lea,
                nathan,
                emma,
                theo,
            ],
            event: event
        )
    }

    // Groupe amis
    static func makeFriendsGroup() -> MeetupGroup {
        let ambre = Participant(
            name: "Ambre",
            location: nil,
            transportMode: .bus,
            travelTime: nil,
            response: .attending,
            hasVoted: false
        )

        let guillaume = Participant(
            name: "Guillaume",
            location: nil,
            transportMode: .car,
            travelTime: nil,
            response: .pending,
            hasVoted: false
        )

        let event = MeetupEvent(
            name: "Sortie samedi",
            date: Date.now.addingTimeInterval(172_800),
            invitationLink:  "https://sweetspot.app/join/AMIS2026",
            meetingZone: nil,
            suggestedPlaces: [],
            votes: [:],
            finalPlaceID: nil,
        )

        return MeetupGroup(
            name: "Amis",
//            invitationCode: "AMIS2026",
            participants: [
                ambre,
                guillaume,
            ],
            event: event
        )
    }
    
    // Groupe dîner
    static func makeDinnerGroup() -> MeetupGroup {

        let alice = Participant(
            name: "Alice",
            location: GeoPoint(
                latitude: 48.8750,
                longitude: 2.3350
            ),
            transportMode: .walking,
            travelTime: 18 * 60,
            response: .attending,
            hasVoted: true
        )

        let thomas = Participant(
            name: "Thomas",
            location: GeoPoint(
                latitude: 48.8740,
                longitude: 2.3560
            ),
            transportMode: .bus,
            travelTime: 22 * 60,
            response: .attending,
            hasVoted: true
        )

        let julie = Participant(
            name: "Julie",
            location: GeoPoint(
                latitude: 48.8660,
                longitude: 2.3250
            ),
            transportMode: .car,
            travelTime: 15 * 60,
            response: .maybe,
            hasVoted: false
        )

        let lucas = Participant(
            name: "Lucas",
            location: GeoPoint(
                latitude: 48.8580,
                longitude: 2.3520
            ),
            transportMode: .bicycle,
            travelTime: 20 * 60,
            response: .pending,
            hasVoted: true
        )

        let event = MeetupEvent(
            name: "Dîner à Paris",
            date: Date.now.addingTimeInterval(86_400),
            invitationLink: "https://sweetspot.app/join/DINER026",
            meetingZone: MeetingZone(
                center: GeoPoint(
                    latitude: 48.8656,
                    longitude: 2.3410
                ),
                polygon: [
                    GeoPoint(latitude: 48.8550, longitude: 2.3200),
                    GeoPoint(latitude: 48.8780, longitude: 2.3200),
                    GeoPoint(latitude: 48.8780, longitude: 2.3600),
                    GeoPoint(latitude: 48.8550, longitude: 2.3600),
                ]
            ),
            suggestedPlaces: [],
            votes: [:],
            finalPlaceID: nil
        )

        return MeetupGroup(
            name: "Dîner Paris",
//            invitationCode: "DINER2026",
            participants: [
                alice,
                thomas,
                julie,
                lucas,
            ],
            event: event
        )
    }
}
