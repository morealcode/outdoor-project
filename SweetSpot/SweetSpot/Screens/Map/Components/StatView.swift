//
//  StatView.swift
//  SweetSpot
//
//  Created by morealcode on 09/08/2026.
//

import SwiftUI

struct StatView: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 6) {

            Image(systemName: icon)
                .foregroundStyle(.accent)

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    StatView(
        icon: "clock",
        title: "Temps moyen",
        value: "18 min"
    )
}
