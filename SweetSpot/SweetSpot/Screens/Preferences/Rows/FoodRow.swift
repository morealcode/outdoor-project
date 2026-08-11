//
//  FoodRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI
import Flow

struct FoodRow: View {
    var arrOfFood = CuisineType.arrOfCuisineType
    var body: some View {
        VStack {
            HStack {
                Text("Cuisines Favorites")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HFlow {
                ForEach(arrOfFood) { cuisine in
                    FoodTile(food: cuisine)
                }
            }
          
        }
        .padding()
    }
}

#Preview {
    FoodRow()
}

#Preview {
    PreferencesView()
}
