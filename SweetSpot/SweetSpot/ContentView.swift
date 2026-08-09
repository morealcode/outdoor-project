//
//  ContentView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct ContentView: View {

    @Environment(AppStore.self) private var store

    var body: some View {
        TabView {
            Tab("Créer", systemImage: "party.popper.fill") {
                NewEventView(groupID: UUID())
            }

            Tab("Groupes", systemImage: "person.3.fill") {
                GroupList()
            }

            Tab("Préférences", systemImage: "gearshape.fill") {
                PreferencesView()
            }
        }
        .environment(\.symbolVariants, .none)
    }
}

#Preview {
    ContentView()
        .environment(MockData.makeStore())
}
