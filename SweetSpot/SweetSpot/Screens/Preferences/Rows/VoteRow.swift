//
//  VoteRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct VoteRow: View {
    let participants: [Participant]

    private var totalCount: Int {
        participants.count
    }

    private var votedCount: Int {
        participants.filter(\.hasVoted).count
    }

    private var attendingCount: Int {
        participants.filter { $0.response == .attending }.count
    }

    private var respondedCount: Int {
        participants.filter { $0.response != .pending }.count
    }

    var body: some View {
        VStack {
            Text("Résumé")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(spacing: 20) {
                ProgressTile2(
                    title: "Votes faits",
                    value: votedCount,
                    total: totalCount
                )

                ProgressTile2(
                    title: "Participants présents",
                    value: attendingCount,
                    total: totalCount
                )

                ProgressTile2(
                    title: "Participants ayant répondu",
                    value: respondedCount,
                    total: totalCount
                )
            }
            .padding()
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.secondary.opacity(0.4), lineWidth: 2)
            }
        }
    }
}

private struct ProgressTile2: View {
    let title: String
    let value: Int
    let total: Int

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)

                Spacer()

                Text("\(value) / \(total)")
                    .foregroundStyle(.secondary)
            }

            ProgressView(
                value: Double(value),
                total: Double(max(total, 1))
            )
        }
    }
}

#Preview {
    VoteRow(
        participants: [
            .mock,
            .mockWalking,
            .mockBicycle,
            .mockCar
        ]
    )
}
