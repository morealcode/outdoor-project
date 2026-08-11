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
                    LabelUIKitRepresentable(text: "Bienvenue")
                        .frame(height: 15)
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

struct LabelUIKitRepresentable: UIViewRepresentable {
    let text: String
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        
    }
}

#Preview {
    HomeView()
}
