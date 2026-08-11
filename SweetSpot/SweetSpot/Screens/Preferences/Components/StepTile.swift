//
//  StepView.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct StepTile: View {
    let number: Int
    let title: String
    let currentSituation: String
    var body: some View {
        HStack(alignment: .center, spacing: 20){
            Circle()
                .fill(.greenFill.opacity(0.4))
                .stroke(.greenC, lineWidth: 3)
                .frame(width: 50, height: 50)
                .overlay(alignment: .center) {
                    Text("\(number)")
                        .bold()
                        .foregroundStyle(.greenFont)
                }
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                    .bold()
                Text(currentSituation)
                    .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    StepTile(
        number: 1,
        title: "Départ",
        currentSituation: "3 Rue de la Paix, 75002 Paris"
    )
}

#Preview {
    RecapitulatifView()
}
