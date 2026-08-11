//
//  TimeRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct TimeRow: View {
    @Environment(AppStore.self) private var store
    
    var timeSelected: Int {
        store.currentUser.preferences.favoriteTravelTime ?? 0
    }
    
    let timeArr = [15, 20, 30, 45, 60]
    
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
                    TimeTile(time: time)
                }
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

#Preview {
    let store = MockData.makeStore()
    TimeRow()
        .environment(store)
}

//#Preview {
//    PreferencesView()
//}
