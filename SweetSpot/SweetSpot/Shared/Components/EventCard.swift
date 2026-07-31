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
        
        HStack(spacing: 20) {
            Image(systemName: "calendar.badge.checkmark")
                .font(.system(size: 40))
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(event.name)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                
                Text(event.date.formatted(
                    date: .complete,
                    time: .shortened
                    )
                )
                .font(.callout)
                .foregroundStyle(.white.opacity(0.9))
            }
            
            Spacer()
            
            Button(action: action) {
               Image(systemName: "pencil")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
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
    .padding()
}
