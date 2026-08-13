//
//  MockData.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import Foundation

enum MockDataV2 {

    // Store complet
    static func makeStore() async -> AppStore {
        let currentUser = User(
            name: "Ambre",
            preferences: UserPreferences()
        )

        return await AppStore(
            currentUser: currentUser,
            groups: [
                makePastGroup(),
                makeProjectGroup(),
                makeFriendsGroup(),
                makeDinnerGroup(),
            ]
        )
    }

    // Groupe projet iOS
    // DINER POTIN
    // ≈ 48.8615, 2.3400 (Louvre / Palais-Royal)
    // Restaurants zone centre-ouest
    static func makeProjectGroup() async -> MeetupGroup {
        let ambre = Participant(
            name: "Ambre",
            location: GeoPoint(
                latitude: 48.8612,
                longitude: 2.3395
            ),
            transportMode: .transport,
            travelTime: 18 * 60,
            response: .attending,
            hasVoted: true
        )

        let lucas = Participant(
            name: "Lucas",
            location: GeoPoint(
                latitude: 48.8630,
                longitude: 2.3420
            ),
            transportMode: .bicycle,
            travelTime: 15 * 60,
            response: .pending,
            hasVoted: false
        )

        let chloe = Participant(
            name: "Chloé",
            location: GeoPoint(
                latitude: 48.8600,
                longitude: 2.3375
            ),
            transportMode: .walking,
            travelTime: 12 * 60,
            response: .attending,
            hasVoted: false
        )

        let maxime = Participant(
            name: "Maxime",
            location: GeoPoint(
                latitude: 48.8640,
                longitude: 2.3405
            ),
            transportMode: .bicycle,
            travelTime: 10 * 60,
            response: .unavailable,
            hasVoted: false
        )

        let clara = Participant(
            name: "Clara",
            location: GeoPoint(
                latitude: 48.8590,
                longitude: 2.3420
            ),
            transportMode: .transport,
            travelTime: 20 * 60,
            response: .maybe,
            hasVoted: false
        )

        let hugo = Participant(
            name: "Hugo",
            location: GeoPoint(
                latitude: 48.8645,
                longitude: 2.3440
            ),
            transportMode: .car,
            travelTime: 14 * 60,
            response: .pending,
            hasVoted: false
        )

        let lea = Participant(
            name: "Léa",
            location: GeoPoint(
                latitude: 48.8610,
                longitude: 2.3355
            ),
            transportMode: .transport,
            travelTime: 16 * 60,
            response: .attending,
            hasVoted: false
        )

        let sushiPlace = Place(
            name: "Sushi One",
            address: "12 rue du Temple, Paris",
            location: GeoPoint(
                latitude: 48.8615,
                longitude: 2.3540
            ),
//            category: .sushi,
//            rating: 4.6,
//            priceLevel: 2,
        )

        let barPlace = Place(
            name: "Central Bar",
            address: "8 rue de Bretagne, Paris",
            location: GeoPoint(
                latitude: 48.8630,
                longitude: 2.3600
            ),
//            category: .bar,
//            rating: 4.3,
//            priceLevel: 2,
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

        let group = await MeetupGroup.create(
            name: "Diner potin",
            participants: [
                ambre,
                lucas,
                chloe,
                maxime,
                clara,
                hugo,
                lea,
            ],
            event: event,
        )

        print("\n\n")
        print(group.event.meetingZone?.center ?? "nothing")
        print(group.event.suggestedPlaces)

        return group
    }

    // Groupe amis
    // AMIS
    // ≈ 48.8564, 2.3697 (Bastille / Marais Est)
    // Restaurants zone est
    static func makeFriendsGroup() async -> MeetupGroup {
        let ambre = Participant(
            name: "Ambre",
            location: GeoPoint(
                latitude: 48.8558,
                longitude: 2.3695
            ),
            transportMode: .transport,
            travelTime: 18 * 60,
            response: .attending,
            hasVoted: false
        )

        let guillaume = Participant(
            name: "Guillaume",
            location: GeoPoint(
                latitude: 48.8575,
                longitude: 2.3720
            ),
            transportMode: .car,
            travelTime: 15 * 60,
            response: .pending,
            hasVoted: false
        )

        let nathan = Participant(
            name: "Nathan",
            location: GeoPoint(
                latitude: 48.8540,
                longitude: 2.3675
            ),
            transportMode: .bicycle,
            travelTime: 13 * 60,
            response: .unavailable,
            hasVoted: false
        )

        let emma = Participant(
            name: "Emma",
            location: GeoPoint(
                latitude: 48.8560,
                longitude: 2.3710
            ),
            transportMode: .car,
            travelTime: 9 * 60,
            response: .attending,
            hasVoted: false
        )

        let theo = Participant(
            name: "Théo",
            location: GeoPoint(
                latitude: 48.8585,
                longitude: 2.3685
            ),
            transportMode: .transport,
            travelTime: 17 * 60,
            response: .maybe,
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

        return await MeetupGroup.create(
            name: "Amis",
            participants: [
                ambre,
                guillaume,
                nathan,
                emma,
                theo,
            ],
            event: event,
        )
    }

    // Groupe dîner
    // DÎNER PARIS
    // ≈ 48.8451, 2.3326
    // Montparnasse / Saint-Germain Sud
    // Restaurants zone sud-ouest
    static func makeDinnerGroup() async -> MeetupGroup {

        let alice = Participant(
            name: "Alice",
            location: GeoPoint(
                latitude: 48.8445,
                longitude: 2.3285
            ),
            transportMode: .walking,
            travelTime: 18 * 60,
            response: .attending,
            hasVoted: true
        )

        let thomas = Participant(
            name: "Thomas",
            location: GeoPoint(
                latitude: 48.8470,
                longitude: 2.3320
            ),
            transportMode: .transport,
            travelTime: 22 * 60,
            response: .attending,
            hasVoted: true
        )

        let julie = Participant(
            name: "Julie",
            location: GeoPoint(
                latitude: 48.8430,
                longitude: 2.3340
            ),
            transportMode: .car,
            travelTime: 15 * 60,
            response: .maybe,
            hasVoted: false
        )

        let lucas = Participant(
            name: "Lucas",
            location: GeoPoint(
                latitude: 48.8460,
                longitude: 2.3360
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

        return await MeetupGroup.create(
            name: "Dîner Paris",
            participants: [
                alice,
                thomas,
                julie,
                lucas,
            ],
            event: event,
        )
    }
    
    // Past group
    static func makePastGroup() -> MeetupGroup {

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
                latitude: 48.8618,
                longitude: 2.3560
            ),
            transportMode: .bicycle,
            travelTime: 15 * 60,
            response: .attending,
            hasVoted: true
        )

        let event = MeetupEvent(
            name: "Brunch du mois dernier",
            date: Date.now.addingTimeInterval(-7 * 86_400),
            invitationLink: "",
            meetingZone: nil,
            suggestedPlaces: [],
            votes: [:],
            finalPlaceID: nil
        )

        return MeetupGroup(
            name: "Brunch équipe",
            participants: [
                ambre,
                lucas
            ],
            event: event
        )
    }
}
