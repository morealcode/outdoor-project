//
//  AttendeesRows.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct AttendeesRow: View {

    let participants: [Participant]

    private let colors: [Color] = [
        .blue,
        .green,
        .orange,
        .pink,
        .purple,
        .red,
        .teal,
        .indigo,
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Participants")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: -5) {
                ForEach(Array(participants.enumerated()), id: \.element.id) {
                    index,
                    participant in
                    Circle()
                        .fill(colors[index % colors.count])
                        .frame(width: 40, height: 40)
                        .background(
                            .white,
                            in: .circle.stroke(lineWidth: 5)
                        )
                        .overlay {
                            Text(initial(for: participant))
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        .secondary.opacity(0.4),
                        lineWidth: 2
                    )
            }
        }
    }

    private func initial(for participant: Participant) -> String {
        participant.name
            .prefix(1)
            .uppercased()
    }
}

#Preview {
    AttendeesRow(
        participants: [
            .mock,
            .mockWalking,
            .mockBicycle,
            .mockCar,
        ]
    )
}
