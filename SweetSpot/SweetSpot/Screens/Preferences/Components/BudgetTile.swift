//
//  BudgetTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct BudgetTile: View {

    @Environment(AppStore.self) private var store

    private var preferencesViewModel: PreferencesViewModel {
        PreferencesViewModel(store: store)
    }

    var budgetSelected: Int {
        store.currentUser.preferences.budget ?? 0
    }

    var budget: Int

    var body: some View {
        Button {
            preferencesViewModel.changeBudget(budget)
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
    let store = MockData.makeStore()
    BudgetTile(budget: 20)
        .environment(store)
}
