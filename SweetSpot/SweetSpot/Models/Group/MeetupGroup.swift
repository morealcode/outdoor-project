//
//  Group.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

/*
 Note:
 MapKit ne donne pas autant d'informations que Google Places
 Donc pour la V1 on va se contenter de ce qu'il donne
 Exemple :
 <MKMapItem: 0x144a76bc0> {
     address = "50 Rue des Gravilliers, 75003 Paris, France";
     isCurrentLocation = 0;
     name = "Hanami Teatime";
     placemark = "Hanami Teatime, 50 Rue des Gravilliers, 75003 Paris, France @ <+48.86427900,+2.35570600> +/- 0.00m, region CLCircularRegion (identifier:'<+48.86427901,+2.35570600> radius 141.18', center:<+48.86427901,+2.35570600>, radius:141.18m)";
     timeZone = "Europe/Paris (CEST) offset 7200 (Daylight)";
     url = "https://hanamiteatime.com";
 }
 
 Pour category, on met .french par défaut pour la V1
 
 */

import Foundation
import MapKit

struct MeetupGroup: Identifiable {
    let id = UUID()

    var name: String
    var participants: [Participant]
    var event: MeetupEvent
}

// MARK: - Creation

extension MeetupGroup {

    static func create(
        name: String,
        participants: [Participant],
        event: MeetupEvent
    ) async -> MeetupGroup {

        let center = calculateCenter(of: participants)

        let restaurants = await findRestaurants(
            around: center,
            radius: 2_000,
            limit: 5
        )

        var updatedEvent = event

        updatedEvent.meetingZone = MeetingZone(
            center: center,
            polygon: []
        )

        updatedEvent.suggestedPlaces = restaurants

        return MeetupGroup(
            name: name,
            participants: participants,
            event: updatedEvent
        )
    }
}

// MARK: - Center

extension MeetupGroup {

    static func calculateCenter(
        of participants: [Participant]
    ) -> GeoPoint {

        let locations = participants.compactMap(\.location)

        guard !locations.isEmpty else {
            return GeoPoint(
                latitude: 48.8566,
                longitude: 2.3522
            )
        }

        let latitude =
            locations
            .map(\.latitude)
            .reduce(0, +)
            / Double(locations.count)

        let longitude =
            locations
            .map(\.longitude)
            .reduce(0, +)
            / Double(locations.count)

        return GeoPoint(
            latitude: latitude,
            longitude: longitude
        )
    }
}

// MARK: - Restaurants

extension MeetupGroup {

    static func findRestaurants(
        around center: GeoPoint,
        radius: CLLocationDistance = 2_000,
        limit: Int = 5
    ) async -> [Place] {

        let centerLocation = CLLocation(
            latitude: center.latitude,
            longitude: center.longitude
        )

        let request = MKLocalSearch.Request()

        request.region = MKCoordinateRegion(
            center: center.coordinate,
            latitudinalMeters: radius * 2,
            longitudinalMeters: radius * 2
        )

        request.pointOfInterestFilter = MKPointOfInterestFilter(
            including: [.restaurant]
        )

        request.resultTypes = .pointOfInterest

        do {
            let response = try await MKLocalSearch(
                request: request
            ).start()

            return response.mapItems
                .filter { item in
                    centerLocation.distance(from: item.location) <= radius
                }
                .sorted { first, second in
                    centerLocation.distance(from: first.location)
                        < centerLocation.distance(from: second.location)
                }
                .prefix(limit)
                .map { item in

                    
                    print("New place detected:", item)
                    
                    let coordinate = item.location.coordinate

                    let newPlace = Place(
                        name: item.name ?? "Restaurant",
                        
                        address: item.addressRepresentations?
                            .fullAddress(
                                includingRegion: false,
                                singleLine: true
                            ) ?? "Adresse inconnue",

                        location: GeoPoint(
                            latitude: coordinate.latitude,
                            longitude: coordinate.longitude
                        ),

                        category: .french,
                        rating: nil,
                        priceLevel: nil
                    )

                    print("Place added:", newPlace)

                    return newPlace
                }

        } catch {
            print("MKLocalSearch error:", error)
            return []
        }
    }
}
