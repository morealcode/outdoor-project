//
//  PreferencesView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct PreferencesView: View {
    @State var homeSelected = false
    @State var workSelected = false
    var body: some View {
        ScrollView {
            VStack(spacing: 15){
                Header()
                AdressRow(homeSelected: $homeSelected, workSelected: $workSelected)
                TransportRow()
                BudgetTravelView()
                FoodRow()
                DisponibilityRow()
            }
        }
        .padding()
        .background(.bg)
        
    }
}

#Preview {
    PreferencesView()
}

