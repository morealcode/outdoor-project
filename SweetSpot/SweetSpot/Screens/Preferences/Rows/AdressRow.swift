//
//  AdressRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct AdressRow: View {
    @Binding var homeSelected: Bool
    @Binding var workSelected: Bool
    var body: some View {
        HStack(spacing: 16){
            Button {
                homeSelected = true
                workSelected = false
                
            } label: {
                AdressTile(
                    isSelected: $homeSelected,
                    iconLeft: "house.fill",
                    iconRight: "checkmark.circle.fill",
                    endroit: "Domicile",
                    adress: "12 Rue de la Paix, Paris"
                )
            }
                        
            Button {
                workSelected = true
                homeSelected = false
                
            } label: {
                AdressTile(
                    isSelected: $workSelected,
                    iconLeft: "briefcase.fill",
                    iconRight: "checkmark.circle.fill",
                    endroit: "Travail",
                    adress: "45 av. des Champs Elysées, Paris"
                )
            }
        }
        .buttonStyle(.plain)
        .padding(.bottom, 16)

    }
}

#Preview {
    AdressRow(homeSelected: .constant(true), workSelected: .constant(false))
}
