//
//  DestinationRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct DestinationRow: View {
    var body: some View {
        VStack {
            Text("Comment s'y rendre")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 20) {
                StepTile(
                    number: 1,
                    title: "Départ",
                    currentSituation: "3 Rue de la Paix, 75002 Paris"
                )
                StepTile(
                    number: 2,
                    title: "À pied - 15 min (1.1km)",
                    currentSituation:
                        "Prenez Rue de la Paix qui continue tout droit."
                )
                StepTile(
                    number: 3,
                    title: "Arrivée : Café des Lumières",
                    currentSituation: "12 Rue de la République"
                )
                
                ButtonMaps()

            }
            .frame(maxWidth: .infinity)
            // .frame(height: 230)
            .padding()
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.secondary).opacity(0.4)
            }

        }
    }
}

#Preview {
    DestinationRow()
}
