//
//  FoodRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import Flow
import SwiftUI

struct FoodRow: View {

    var body: some View {
        VStack {
            HStack {
                Text("Cuisines Favorites")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HFlow {
                ForEach(CuisineType.allCases) { cuisine in
                    FoodTile(food: cuisine)
                }
            }

        }
        .padding()
    }
}

#Preview {
    let store = MockData.makeStore()
    FoodRow()
        .environment(store)
}

#Preview {
    let store = MockData.makeStore()
    PreferencesView()
        .environment(store)
}
