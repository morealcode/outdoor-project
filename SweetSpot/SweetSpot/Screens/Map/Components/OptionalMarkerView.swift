//
//  OptionalMarkerView.swift
//  SweetSpot
//
//  Created by morealcode on 09/08/2026.
//

import SwiftUI

struct OptimalMarkerView: View {

    var body: some View {
        ZStack {
            Circle()
                .fill(.teal)
                .frame(width: 58, height: 58)

            Image(systemName: "star.fill")
                .font(.title2)
                .foregroundStyle(.white)
        }
        .shadow(
            color: .teal.opacity(0.3),
            radius: 10
        )
    }
}

#Preview {
    OptimalMarkerView()
}
