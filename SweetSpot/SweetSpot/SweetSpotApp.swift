//
//  SweetSpotApp.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

@main
struct SweetSpotApp: App {

    let mockVersion: Int = 2

    @State private var storeV2: AppStore?
    @State private var storeV1 = MockData.makeStore()

    var body: some Scene {
        WindowGroup {
            if mockVersion == 2 {

                Group {
                    if let storeV2 {
                        ContentView()
                            .environment(storeV2)
                    } else {
                        ProgressView("Chargement...")
                    }
                }
                .task {
                    storeV2 = await MockDataV2.makeStore()
                }

            } else {

                ContentView()
                    .environment(storeV1)
            }
        }
    }
}
