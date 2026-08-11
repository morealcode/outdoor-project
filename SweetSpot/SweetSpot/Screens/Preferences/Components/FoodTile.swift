//
//  FoodTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct FoodTile: View {
    let food: CuisineType
    @State private var isSelected = false
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack {
                Text(food.emoji)
                    .opacity(isSelected ? 1.0 : 0.5)
                Text(food.name)
                    .font(.caption)
                    .foregroundStyle(
                        isSelected ? .black : .secondary.opacity(0.5)
                    )
            }
        }
        .frame(height: 10)
        .padding()
        .background(
            isSelected ? .black : .secondary.opacity(0.5),
            in: .capsule.stroke(lineWidth: 2)
        )
        .contentShape(.capsule)
        .buttonStyle(.plain)
    }
}

#Preview {
    FoodTile(food: CuisineType.arrOfCuisineType[0])
}

#Preview {
    PreferencesView()
}
