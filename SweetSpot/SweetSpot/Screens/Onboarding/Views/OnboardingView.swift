//
//  OnboardingView.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding")
    private var hasSeenOnboarding = false

    @State private var currentPage = 0

    private let pages = [
        OnboardingPage(
            image: "onboarding1",
            title: "Bienvenue",
            description:
                "Trouvez le point de rencontre parfait avec vos amis. Sweet Spot est votre allié pour des sorties réussies !"
        ),
        OnboardingPage(
            image: "onboarding2",
            title: "Simple et rapide",
            description:
                "Créez un groupe, un événement, et laissez l’app suggérer des lieux optimaux pour tous les participants."
        ),
        OnboardingPage(
            image: "onboarding4",
            title: "C'est tout bon !",
            description:
                "Votre profil est prêt ! Vous pouvez maintenant créer votre premier événement ou rejoindre un groupe."
        ),
    ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(pages.indices, id: \.self) { index in
                    OnboardingPageView(page: pages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))

            Button {
                nextPage()
            } label: {
                Text(
                    currentPage == pages.count - 1
                        ? "Commencer"
                        : "Continuer"
                )
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(
                    LinearGradient(
                        colors: [
                            Color(.accent),
                            Color(.accentBlue),
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .black.opacity(0.25), radius: 12, x: 0, y: 0)
            }
            .padding()
        }
    }

    private func nextPage() {
        if currentPage < pages.count - 1 {
            withAnimation {
                currentPage += 1
            }
        } else {
            finishOnboarding()
        }
    }

    private func finishOnboarding() {
        hasSeenOnboarding = true
    }
}

#Preview {
    OnboardingView()
}
