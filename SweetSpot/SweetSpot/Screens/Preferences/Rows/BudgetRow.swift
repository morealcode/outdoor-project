//
//  BudgetRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct BudgetRow: View {
    @State private var budgetSelected = 0
    let budgetArr = [20,40,60,80,100]
    var body: some View {
        VStack {
            HStack {
                Text("Budget par personne")
                Spacer()
                Text("\(budgetSelected) €")
            }
            .font(.subheadline)

            HStack {
                ForEach(budgetArr, id: \.self) { budget in
                    BudgetTile(budgetSelected: $budgetSelected, budget: budget)
                }
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
        .padding(.vertical, 5)

    }
}

#Preview {
    BudgetRow()
}


#Preview {
    PreferencesView()
}
