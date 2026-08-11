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
            transportMode: .transport,
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
            invitationLink: "",
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
            name: "Projet iOS",
            invitationCode: "IOS2026",
            participants: [
                ambre,
                lucas,
            ],
            event: event
        )
    }

    // Groupe amis
    static func makeFriendsGroup() -> MeetupGroup {
        let ambre = Participant(
            name: "Ambre",
            location: nil,
            transportMode: .transport,
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
            invitationLink: "",
            meetingZone: nil,
            suggestedPlaces: [],
            votes: [:],
            finalPlaceID: nil,
        )

        return MeetupGroup(
            name: "Amis",
            invitationCode: "AMIS2026",
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
            transportMode: .transport,
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
            invitationLink: "",
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
            invitationCode: "DINER2026",
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
