//
//  BudgetTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct BudgetTile: View {
    @Binding var budgetSelected: Int
    let budget: Int
    var body: some View {
        Button {
            budgetSelected = budget
        } label: {
            HStack {
                Text("\(budget)€")
                    .font(.caption)
                    .foregroundStyle(
                        budgetSelected == budget ? .white : .black
                    )
                    .padding(10)
                    .frame(width: 70, height: 40)
                    .background(
                        budgetSelected == budget ? .black : .gray.opacity(0.1),
                        in: .rect(cornerRadius: 12)
                    )
            }
            .buttonStyle(.plain)
            .contentShape(.rect(cornerRadius: 12))
        }

    }
}

#Preview {
    BudgetTile(budgetSelected: .constant(20), budget: 20)
}
