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
            icon: "hand.wave.fill",
            title: "Bienvenue",
            description:
                "Découvrez rapidement les fonctionnalités principales de l'application."
        ),
        OnboardingPage(
            icon: "sparkles",
            title: "Simple et rapide",
            description:
                "Accédez facilement à vos contenus et réalisez vos actions principales."
        ),
        OnboardingPage(
            icon: "checkmark.circle.fill",
            title: "C'est parti !",
            description: "Vous êtes maintenant prêt à utiliser l'application."
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
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
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

// MARK: - Model

struct OnboardingPage {
    let icon: String
    let title: String
    let description: String
}

// MARK: - Page

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: page.icon)
                .font(.system(size: 70))
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

// MARK: - Preview

#Preview {
    OnboardingView()
}
