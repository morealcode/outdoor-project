//
//  BudgetView.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct BudgetTravelView: View {
    var body: some View {
        VStack {
            Text("Trajet & Budget")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            TimeRow()
            BudgetRow()
        }
    }
}

#Preview {
    BudgetTravelView()
}

#Preview {
    PreferencesView()
}
