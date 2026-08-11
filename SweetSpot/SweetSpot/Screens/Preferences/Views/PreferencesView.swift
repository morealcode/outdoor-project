//
//  PreferencesView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15){
                Header()
                AdressRow()
                TransportRow()
                BudgetTravelView()
                FoodRow()
                DisponibilityRow()
            }
        }
        .padding()
        .background(.backgroundApp)
        
    }
}

#Preview {
    let store = MockData.makeStore()
    PreferencesView()
        .environment(store)
}
