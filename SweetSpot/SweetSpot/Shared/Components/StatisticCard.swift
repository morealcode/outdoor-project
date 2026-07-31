//
//  StatisticCard.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct StatisticCard: View {
    
    let icon: String
    let iconColor: Color
    let value: Int
    let title: String
    
    var body: some View {
        
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(iconColor)
            
            Text("\(value)")
                .font(.title2.bold())
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3)
    }
}

#Preview {
    
    ZStack {
        
        Color(.backgroundApp)
            .ignoresSafeArea()
        
        HStack {
            StatisticCard(
                icon: "checkmark.circle.fill",
                iconColor: .green,
                value: 6,
                title: "Ont répondu")
            
            StatisticCard(
                icon: "clock.fill",
                iconColor: .orange,
                value: 2,
                title: "En attente")
        }
    }
}
