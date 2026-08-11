//
//  ContentView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("hasSeenOnboarding")
    private var hasSeenOnboarding = false

    @Environment(AppStore.self)
    private var store

    @State private var didResetOnboarding = false

    var body: some View {
        Group {
            if hasSeenOnboarding {
                TabView {
                    Tab("Home", systemImage: "party.popper.fill") {
                        HomeView()
                        // NewEventView(groupID: UUID())
                    }

                    Tab("Groupes", systemImage: "person.3.fill") {
                        GroupList()
                    }

                    Tab("Préférences", systemImage: "gearshape.fill") {
                        PreferencesView()
                    }
                }
                .environment(\.symbolVariants, .none)

            } else {
                OnboardingView()
            }
        }
        .onAppear {
            #if DEBUG
                if !didResetOnboarding {
                    hasSeenOnboarding = false
                    didResetOnboarding = true
                }
            #endif
        }
    }
}

#Preview {
    ContentView()
        .environment(MockData.makeStore())
}
