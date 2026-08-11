//
//  OnboardingPageView.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(page.image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.blue)

            Text(page.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text(page.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()
        }
    }
}

#Preview {
    OnboardingPageView(
        page: OnboardingPage(
            image: "onboarding1",
            title: "Bienvenue",
            description:
                "Trouvez le point de rencontre parfait avec vos amis. Sweet Spot est votre allié pour des sorties réussies !"
        )
    )
}
