//
//  DayTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct DayTile: View {
    let day: String
    @State private var isSelected = false
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
                Text(day)
                    .bold()
                    .foregroundStyle(isSelected ? .black : .secondary.opacity(0.5))
                    .frame(width: 45, height: 45)
                    .background(
                        isSelected ? .black : .secondary.opacity(0.5),
                        in: .rect(cornerRadius: 12).stroke(lineWidth: 2)
                    )
                    .contentShape(.rect(cornerRadius: 12))
        }
    }
}

#Preview {
    DayTile(day: "Lun")
}


#Preview {
    DisponibilityRow()
}

