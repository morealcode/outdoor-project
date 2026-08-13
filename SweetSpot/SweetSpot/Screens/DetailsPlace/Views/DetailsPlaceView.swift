//
//  SuggestView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct DetailsPlaceView: View {

    let lieu: Place
    let participants: [Participant]
    let styleLieux: StyleLieux

    var body: some View {

        ScrollView {

            VStack(spacing: 20) {

                CarousselView()

                PlaceView(lieu: lieu)

                ComparatifTpsTrajetView(participants: participants)

                LocationInterestView(styleLieux: styleLieux)
            }
            .padding()
        }
        .background(.backgroundApp)
    }
}

#Preview {
    DetailsPlaceView(
        lieu: Place.mock,
        participants: [.mock, .mockWalking, .mockBicycle, .mockCar],
        styleLieux: StyleLieux.exemple[0]
    )
}
