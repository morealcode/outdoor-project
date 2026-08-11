//
//  DisponibilityRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct DisponibilityRow: View {

    var body: some View {
        VStack {
            HStack {
                Text("Disponibilités")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 10) {
                ForEach(Days.allCases) { day in
                    DayTile(day: day)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)

    }
}

#Preview {
    let store = MockData.makeStore()
    DisponibilityRow()
        .environment(store)
}
