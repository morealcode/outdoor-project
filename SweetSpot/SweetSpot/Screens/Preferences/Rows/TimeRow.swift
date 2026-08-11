//
//  TimeRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct TimeRow: View {
    let timeArr = [15, 20, 30, 45, 60]
    @State private var timeSelected = 0
    var body: some View {
        VStack {
            HStack {
                Text("Temps de trajet accepté")
                Spacer()
                Text("\(timeSelected) min")
            }
            .font(.subheadline)
            
            HStack {
                ForEach(timeArr, id: \.self) { time in
                    TimeTile(timeSelected: $timeSelected, time: time)
                }
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

#Preview {
    TimeRow()
}

#Preview {
    PreferencesView()
}
