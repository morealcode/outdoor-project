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

    var body: some View {
        Group {
            if currentPage == 2 {

                // 3 — PROFIL
                ProfileOnboardingView {
                    currentPage = 3
                }

            } else {

                // 1, 2 et 4
                VStack {
                    OnboardingPageView(
                        page: currentOnboardingPage
                    )

                    Button {
                        nextPage()
                    } label: {
                        CustomButtonText(
                            text: currentPage == 3
                                ? "Commencer"
                                : "Continuer"
                        )
                    }
                    .padding()
                }
            }
        }
        .animation(.easeInOut, value: currentPage)
    }

    private var currentOnboardingPage: OnboardingPage {
        switch currentPage {
        case 0:
            return OnboardingPage(
                image: "onboarding1",
                title: "Bienvenue",
                description:
                    "Trouvez le point de rencontre parfait avec vos amis. Sweet Spot est votre allié pour des sorties réussies !"
            )

        case 1:
            return OnboardingPage(
                image: "onboarding2",
                title: "Simple et rapide",
                description:
                    "Créez un groupe, un événement, et laissez l’app suggérer des lieux optimaux pour tous les participants."
            )

        default:
            return OnboardingPage(
                image: "onboarding4",
                title: "C'est tout bon !",
                description:
                    "Votre profil est prêt ! Vous pouvez maintenant créer votre premier événement ou rejoindre un groupe."
            )
        }
    }

    private func nextPage() {
        switch currentPage {
        case 0:
            currentPage = 1

        case 1:
            currentPage = 2

        case 3:
            hasSeenOnboarding = true

        default:
            break
        }
    }
}

#Preview {
    let store = MockData.makeStore()
    
    OnboardingView()
    .environment(store)
}
