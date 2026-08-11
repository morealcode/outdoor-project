//
//  DisponibilityRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct DisponibilityRow: View {
    var arrOfDay = ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"]
    var body: some View {
        VStack {
            HStack {
                Text("Disponibilités")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 10){
                ForEach(arrOfDay, id: \.self) { day in
                    DayTile(day: day)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)

    }
}

#Preview {
    DisponibilityRow()
}

#Preview {
    PreferencesView()
}
