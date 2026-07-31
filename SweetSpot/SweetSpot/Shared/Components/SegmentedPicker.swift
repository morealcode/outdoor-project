//
//  SegmentedPicker.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct SegmentedPicker: View {

    @Binding var selection: Int

    var body: some View {
        VStack(spacing: 8) {

            HStack {
                segment(title: "Participants", index: 0)
                segment(title: "Activité", index: 1)
            }
            .frame(height: 44)

            GeometryReader { geo in
                ZStack(alignment: .leading) {

                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .frame(height: 1)

                    Capsule()
                        .fill(.accent)
                        .frame(width: geo.size.width / 2, height: 4)
                        .offset(x: selection == 0 ? 0 : geo.size.width / 2)
                }
                .animation(.easeInOut, value: selection)
            }
            .frame(height: 4)
        }
    }

    private func segment(title: String, index: Int) -> some View {
        Button {
            selection = index
        } label: {
            Text(title)
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
        }
    }
}
#Preview {
    SegmentedPicker(selection: .constant(1))
}
