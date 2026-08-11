//
//  ProfileOnboardingView.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//

import SwiftUI

struct ProfileOnboardingView: View {
    @State private var username = ""
    @State private var home = ""
    @State private var transport: TransportMode = .bus
    @State private var travelTime = 30

    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Vos premières infos")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            VStack(alignment: .leading, spacing: 8) {
                Text("Pseudo")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                TextField("", text: $username)
                    .textFieldStyle(.roundedBorder)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Domicile")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                TextField("", text: $home)
                    .textFieldStyle(.roundedBorder)
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("TRANSPORT PRÉFÉRÉ")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Picker("Transport", selection: $transport) {
                    ForEach(TransportMode.allCases) { transport in
                        Label(
                            transport.rawValue,
                            systemImage: transport.systemImage
                        )
                        .tag(transport)
                    }
                }
                .pickerStyle(.segmented)
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("TEMPS DE TRAJET ACCEPTÉ")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Picker("Temps", selection: $travelTime) {
                    Text("15 min").tag(15)
                    Text("20 min").tag(20)
                    Text("30 min").tag(30)
                    Text("45 min").tag(45)
                    Text("1h+").tag(60)
                }
                .pickerStyle(.segmented)
            }

            Spacer()

            Button {
                saveProfile()
                onContinue()
            } label: {
                CustomButtonText(text: "Continuer")
            }
            .disabled(username.isEmpty || home.isEmpty)
        }
        .padding()
    }

    private func saveProfile() {
        print(username)
        print(home)
        print(transport)
        print(travelTime)

        // Ici tu pourras ensuite enregistrer
        // les données dans ton AppStore.
    }
}

#Preview {
    ProfileOnboardingView {
        print("Continuer")
    }
}
