//
//  LieuxCardView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct LieuxCardView: View {

    let lieu: Place
    let isSelected: Bool
    let onSelect: () -> Void

    var body: some View {

        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image(lieu.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            colors: [.clear, .black.opacity(0.65)],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )

                VStack {
                    HStack {
                        Text("\(lieu.matchPercentage)% match")
                            .font(.caption2.bold())
                            .foregroundStyle(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(lieu.matchColor, in: Capsule())

                        Spacer()

                        Button(action: onSelect) {
                            Image(systemName: "checkmark")
                                .font(.caption2.bold())
                                .foregroundStyle(
                                    isSelected ? .white : .gray.opacity(0.6)
                                )
                                .padding(8)
                                .background(
                                    isSelected ? Color.green : Color.white,
                                    in: Circle()
                                )
                        }
                        .buttonStyle(.borderless)
                    }

                    Spacer()
                }
                .padding(12)

                VStack(alignment: .leading, spacing: 2) {
                    Text(lieu.name)
                        .font(.headline.bold())
                        .foregroundStyle(.white)

                    Text(lieu.category.rawValue)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }
                .padding(12)
            }
            .frame(height: 150)

            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundStyle(.yellow)

                Text(String(format: "%.1f", lieu.rating))
                    .font(.caption2.bold())

                Text("\(lieu.reviewCount) avis")
                    .font(.caption2)
                    .foregroundStyle(.gray)

                Text("•")
                    .font(.caption2)
                    .foregroundStyle(.gray)

                Image(systemName: "clock")
                    .font(.caption2)
                    .foregroundStyle(.gray)

                Text(lieu.duration)
                    .font(.caption2)
                    .foregroundStyle(.gray)

                Text("•")
                    .font(.caption2)
                    .foregroundStyle(.gray)

                Text(lieu.priceRange)
                    .font(.caption2.bold())

                Spacer(minLength: 0)

                Text(lieu.tag)
                    .font(.caption2.bold())
                    .foregroundStyle(lieu.tagColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(lieu.tagColor.opacity(0.15), in: Capsule())
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
        )
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }

}

#Preview("Sélectionné") {
    LieuxCardView(
        lieu: .mock,
        isSelected: true,
        onSelect: {}
    )
    .padding()
}

#Preview("Non sélectionné") {
    LieuxCardView(
        lieu: .mockBar,
        isSelected: false,
        onSelect: {}
    )
    .padding()
}
