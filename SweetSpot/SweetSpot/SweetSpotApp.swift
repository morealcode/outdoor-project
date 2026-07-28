//
//  SweetSpotApp.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

@main
struct SweetSpotApp: App {
    @State private var store = MockData.makeStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
