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
            
            NewEventView(groupID: UUID())
                .tabItem {
                    Label("Acceuil", systemImage: "house")
                        .environment(\.symbolVariants, .none)
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(MockData.makeStore())
}
