//
//  ButtonMapsq.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct ButtonMaps: View {
    var body: some View {
        Button {
            print("Tapped")
        } label: {
            HStack {
                Image(systemName: "location")
                    .foregroundStyle(.greenFont)
                Text("Ouvrir dans Plans")
            }
            .frame(width: 300)
            .padding()
            .background(
                .secondary.opacity(0.4),
                in: .rect(cornerRadius: 12).stroke(lineWidth: 2)
            )
            .contentShape(.rect(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ButtonMaps()
}
