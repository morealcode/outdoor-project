//
//  PersonMarkerView.swift
//  SweetSpot
//
//  Created by morealcode on 09/08/2026.
//

import SwiftUI

struct PersonMarkerView: View {

    var body: some View {
        VStack(spacing: -3) {

            ZStack {
                Circle()
                    .fill(.indigo)
                    .frame(width: 44, height: 44)

                Image(systemName: "person.fill")
                    .foregroundStyle(.white)
            }

            Circle()
                .fill(.indigo)
                .frame(width: 12, height: 12)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                }
        }
        .shadow(
            color: .indigo.opacity(0.3),
            radius: 8
        )
    }
}
