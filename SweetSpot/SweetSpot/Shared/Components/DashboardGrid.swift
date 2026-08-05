//
//  DashboardGrid.swift
//  SweetSpot
//
//  Created by apprenant120 on 05/08/2026.
//

import SwiftUI

struct DashboardGrid: View {
    
    let viewmodel: GroupViewModel
    
    var body: some View {
        
        HStack {
            StatisticCard(
                icon: "checkmark.circle.fill",
                iconColor: .green,
                value: viewmodel.attendingCount,
                title: "Ont répondu")
            
            StatisticCard(
                icon: "clock.fill",
                iconColor: .orange,
                value: viewmodel.pendingCount,
                title: "En attente")
            
            StatisticCard(
                icon: "eye.fill",
                iconColor: .blue,
                value: viewmodel.maybeCount,
                title: "À voir")
            
            StatisticCard(
                icon: "minus.circle.fill",
                iconColor: .red,
                value: viewmodel.pendingCount,
                title: "Indisponible")
        }
    }
}

#Preview {
    
    let store = MockData.makeStore()
    
    DashboardGrid(
        viewmodel: GroupViewModel(
            store: store,
            groupID: UUID()
        )
    )
    .environment(store)
}
