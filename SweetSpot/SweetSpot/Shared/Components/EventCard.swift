//
//  EventCard.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct EventCard: View {
    
    let event: MeetupEvent
    let action: () -> Void
    
    var body: some View {
        
        HStack(spacing: 25) {
            Image(systemName: "calendar.badge.checkmark")
                .font(.system(size: 38))
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(event.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(event.date.formatted(
                    date: .abbreviated,
                    time: .omitted
                    )
                )
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
                
                Text(event.date.formatted(
                    date: .omitted,
                    time: .shortened
                    )
                )
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
            }
            
            Spacer()
            
            Button(action: action) {
               Image(systemName: "pencil")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 99))
            }
        }
        .padding()
        
        .background(
            LinearGradient(
                colors: [
                    Color(.accent),
                    Color(.accentBlue)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    EventCard(
        event: MeetupEvent(
            name: "Soirée entre amis",
            date: Date(),
            invitationLink: "",
            suggestedPlaces: [],
            votes: [:]
        ),
        action: {}
    )
}
