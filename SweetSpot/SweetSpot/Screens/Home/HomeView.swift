//
//  HomeView.swift
//  SweetSpot
//
//  Created by Guillaume Richard on 11/08/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Bienvenue")
                        .font(.largeTitle)
                        .bold()
                    Text("Guillaume")
                        .font(.title)
                        .fontWeight(.medium)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text("Vous n'avez pas encore d'activités de planifier.")
            Spacer()

            PrimaryButton(title: "Créer un événement", systemImage: "") {
                print("Tapped")
            }

        }
        .padding()
        .background(.backgroundApp)
    }
}

#Preview {
    HomeView()
}
