//
//  ParticipantRow.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct ParticipantRow: View {
    
    let participant: Participant
    
    var body: some View {
        
        HStack(spacing: 14) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(participant.name)
                    .font(.headline)
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color(participant.response.colorName))
                        .frame(width: 8)
                    
                    Text(participant.response.title)
                        .font(.caption)
                        .foregroundStyle(Color(participant.response.colorName))
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                if participant.response == .unavailable {
                    Label(
                        "Indisponible",
                        systemImage: "minus.circle"
                    )
                    .font(.caption)
                    .foregroundStyle(.red)
                    
                } else if participant.hasVoted {
                    Label(
                        "À voté",
                        systemImage: "chart.bar.fill"
                    )
                    .font(.caption)
                    
                } else {
                    Label(
                        "Relancer",
                        systemImage: "paperplane.fill"
                    )
                    .font(.caption)
                    .foregroundStyle(.accentGreen)
                }
            }
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ParticipantRow(participant: Participant(
        name: "Ambre",
        transportMode: .car,
        response: .attending,
        hasVoted: true
        )
    )
    
    ParticipantRow(participant: Participant(
        name: "Guillaume",
        transportMode: .car,
        response: .pending,
        hasVoted: false
        )
    )
    
    ParticipantRow(participant: Participant(
        name: "Lucas",
        transportMode: .car,
        response: .unavailable,
        hasVoted: false
        )
    )
}
