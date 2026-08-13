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
            participants: participants,
            groupName: name,
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

    // Centre pondéré selon leurs contraintes

    static func calculateCenter(
        of participants: [Participant]
    ) -> GeoPoint {

        let validParticipants = participants.compactMap {
            participant
                -> (location: GeoPoint, weight: Double)? in

            guard let location = participant.location else {
                return nil
            }

            let weight: Double

            if let travelTime = participant.travelTime,
                travelTime > 0
            {
                weight = 1 / travelTime
            } else {
                weight = 1
            }

            return (
                location: location,
                weight: weight
            )
        }

        guard !validParticipants.isEmpty else {
            return GeoPoint(
                latitude: 48.8566,
                longitude: 2.3522
            )
        }

        let totalWeight =
            validParticipants
            .map(\.weight)
            .reduce(0, +)

        let latitude =
            validParticipants
            .reduce(0) { result, participant in
                result
                    + participant.location.latitude
                    * participant.weight
            }
            / totalWeight

        let longitude =
            validParticipants
            .reduce(0) { result, participant in
                result
                    + participant.location.longitude
                    * participant.weight
            }
            / totalWeight

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
        participants: [Participant],
        groupName: String,
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

            // MARK: 1. Restaurants dans les 2 km

            // Limites pour ETA

            let relevantParticipants = participants.filter {
                $0.location != nil
                    && $0.travelTime != nil
                    && $0.response.shouldAffectMeetingLocation
            }

            let etaBudget = 15
            let absoluteMaxCandidates = 12

            let maxCandidatesToEvaluate = min(
                absoluteMaxCandidates,
                max(
                    1,
                    etaBudget / max(relevantParticipants.count, 1)
                )
            )

            // Fin limites

            let mapItems = response.mapItems
                .filter { item in
                    centerLocation.distance(
                        from: item.location
                    ) <= radius
                }
                .sorted { first, second in
                    centerLocation.distance(from: first.location)
                        < centerLocation.distance(from: second.location)
                }
                .prefix(maxCandidatesToEvaluate)

            print(
                "🔎 \(mapItems.count) restaurants trouvés dans les \(Int(radius)) m"
            )

            var evaluations: [PlaceEvaluation] = []

            // MARK: 2. Évaluation de chaque restaurant

            for item in mapItems {

                let coordinate = item.location.coordinate

                let place = Place(
                    name: item.name ?? "Restaurant",

                    address: item.addressRepresentations?
                        .fullAddress(
                            includingRegion: false,
                            singleLine: true
                        ) ?? "Adresse inconnue",

                    location: GeoPoint(
                        latitude: coordinate.latitude,
                        longitude: coordinate.longitude
                    )
                )

                print("\n📍 Évaluation de \(place.name)")

                if let evaluation = await evaluate(
                    place: place,
                    for: relevantParticipants
                ) {
                    evaluations.append(evaluation)

                    print(
                        """
                        ✅ \(place.name)
                        pire ratio : \(String(format: "%.2f", evaluation.worstRatio))
                        moyenne : \(String(format: "%.2f", evaluation.averageRatio))
                        """
                    )
                }
            }

            // MARK: 3. Classement

            let sortedEvaluations = evaluations.sorted {
                first,
                second in

                if first.worstRatio != second.worstRatio {
                    return first.worstRatio < second.worstRatio
                }

                return first.averageRatio < second.averageRatio
            }

            // MARK: 4. On garde les meilleurs

            let bestPlaces =
                sortedEvaluations
                .prefix(limit)
                .map(\.place)

            print(
                "\n🏆 MEILLEURS LIEUX POUR LE GROUPE \(groupName.uppercased())"
            )

            for (index, evaluation)
                in sortedEvaluations
                .prefix(limit)
                .enumerated()
            {

                print(
                    """
                    \(index + 1). \(evaluation.place.name)
                       worst: \(String(format: "%.0f", evaluation.worstRatio * 100)) %
                       average: \(String(format: "%.0f", evaluation.averageRatio * 100)) %
                    """
                )
            }

            return Array(bestPlaces)

        } catch {
            print("MKLocalSearch error:", error)
            return []
        }
    }
}

// MARK: - Travel Time

extension MeetupGroup {

    static func travelTime(
        from participant: Participant,
        to place: Place
    ) async -> TimeInterval? {

        guard let participantLocation = participant.location else {
            return nil
        }

        let source = MKMapItem(
            location: CLLocation(
                latitude: participantLocation.latitude,
                longitude: participantLocation.longitude
            ),
            address: nil
        )

        let destination = MKMapItem(
            location: CLLocation(
                latitude: place.location.latitude,
                longitude: place.location.longitude
            ),
            address: nil
        )

        let request = MKDirections.Request()

        request.source = source
        request.destination = destination
        request.transportType =
            participant.transportMode.mapKitTransportType

        do {
            let response = try await MKDirections(
                request: request
            ).calculateETA()

            return response.expectedTravelTime

        } catch {
            print(
                "Erreur trajet \(participant.name) → \(place.name):",
                error
            )

            return nil
        }
    }
}

// MARK: - Place Validation

extension MeetupGroup {

    static func isPlaceAcceptable(
        _ place: Place,
        for participants: [Participant]
    ) async -> Bool {

        let tolerance: TimeInterval = 60

        for participant in participants {

            // Pas de localisation :
            // ce participant ne participe pas au calcul.
            guard participant.location != nil else {
                continue
            }

            // Pas de temps maximum :
            // aucune contrainte pour ce participant.
            guard let maxTravelTime = participant.travelTime else {
                continue
            }

            guard
                let estimatedTravelTime = await travelTime(
                    from: participant,
                    to: place
                )
            else {
                // On n'arrive pas à vérifier le trajet.
                // Par sécurité, on rejette le lieu.
                return false
            }

            print(
                """
                \(participant.name) → \(place.name)
                trajet: \(Int(estimatedTravelTime / 60)) min
                maximum: \(Int(maxTravelTime / 60)) min
                """
            )

            if estimatedTravelTime > maxTravelTime + tolerance {
                print("❌ Lieu rejeté pour \(participant.name)")
                return false
            }
        }

        print("✅ Lieu accepté:", place.name)

        return true
    }
}

// MARK: - Place Evaluation

extension MeetupGroup {

    struct PlaceEvaluation {
        let place: Place

        /// Plus cette valeur est petite, plus le lieu est équitable.
        /// Exemple :
        /// Nathan = 0.70
        /// Emma = 0.80
        /// Théo = 0.60
        /// worstRatio = 0.80
        let worstRatio: Double

        /// Utilisé pour départager deux lieux ayant un worstRatio proche.
        let averageRatio: Double

        /// Temps de trajet calculés, pratique pour debug/UI plus tard.
        let travelTimes: [String: TimeInterval]
    }

    static func evaluate(
        place: Place,
        for participants: [Participant]
    ) async -> PlaceEvaluation? {

        var ratios: [Double] = []
        var travelTimes: [String: TimeInterval] = [:]

        for participant in participants {

            guard participant.location != nil else {
                continue
            }

            guard let maxTravelTime = participant.travelTime else {
                continue
            }

            guard
                let estimatedTravelTime = await travelTime(
                    from: participant,
                    to: place
                )
            else {
                // Impossible de calculer le trajet :
                // on préfère ne pas proposer ce lieu.
                return nil
            }

            travelTimes[participant.name] = estimatedTravelTime

            let ratio = estimatedTravelTime / maxTravelTime

            print(
                """
                \(participant.name) → \(place.name)
                trajet : \(Int(estimatedTravelTime / 60)) min
                max : \(Int(maxTravelTime / 60)) min
                ratio : \(String(format: "%.2f", ratio))
                """
            )

            // Le participant dépasserait son temps maximum.
            if ratio > 1 {
                print("❌ \(place.name) rejeté à cause de \(participant.name)")
                return nil
            }

            ratios.append(ratio)
        }

        guard !ratios.isEmpty else {
            return nil
        }

        let worstRatio = ratios.max() ?? 1

        let averageRatio =
            ratios.reduce(0, +)
            / Double(ratios.count)

        return PlaceEvaluation(
            place: place,
            worstRatio: worstRatio,
            averageRatio: averageRatio,
            travelTimes: travelTimes
        )
    }
}

/*

 EXPLICATION DE L'ALGORITHME

 |              | Nathan max 13 | Emma max 9 | Théo max 17 |
 | ------------ | ------------: | ---------: | ----------: |
 | Restaurant A |        12 min |      5 min |       8 min |
 | Restaurant B |         9 min |      7 min |      11 min |


 Pour A :
 Nathan = 12 / 13 = 92 %
 Emma   = 5 / 9   = 56 %
 Théo   = 8 / 17  = 47 %

 worstRatio = 92 %


 Pour B :
 Nathan = 9 / 13  = 69 %
 Emma   = 7 / 9   = 78 %
 Théo   = 11 / 17 = 65 %

 worstRatio = 78 %


 Conclusion :

 Même si A est excellent pour Emma et Théo, Nathan est presque à sa limite. B est donc choisi avant A, car il répartit mieux l'effort entre tout le monde
 On cherche à minimiser la contrainte subie par la personne la plus désavantagée

 Le but de l'app est de trouver un compromis, une personne ne devrait pas devoir subir un trajet très mauvais juste parce que les deux autres ont des trajets excellents
 */
