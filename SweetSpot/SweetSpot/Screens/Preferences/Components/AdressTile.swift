//
//  AdressTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct AdressTile: View {
    @Binding var isSelected: Bool
    var iconLeft: String
    var iconRight: String
    var endroit: String
    var adress: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconLeft)
                Spacer()
                Image(systemName: isSelected ? iconRight : "")
            }
            .foregroundStyle(isSelected ? .green : .secondary)

            Spacer()

            VStack(alignment: .leading) {
                Text(endroit)
                    .font(.callout)
                    .bold()

                Text(adress)
                    .font(.caption)
                    .foregroundStyle(.secondary)

            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding()
        .frame(width: 158, height: 122)
        .background(
            isSelected ? .green : .gray.opacity(0.1),
            in: .rect(cornerRadius: 12).stroke(lineWidth: 2)
        )
        .contentShape(.rect(cornerRadius: 12))
    }

}

#Preview {
    AdressTile(
        isSelected: .constant(false),
        iconLeft: "house.fill",
        iconRight: "checkmark",
        endroit: "Domicile",
        adress: "12 rue de la Paix, Paris"
    )
}
