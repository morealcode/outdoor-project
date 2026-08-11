//
//  Header.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            Text("MON COMPTE")
                .font(.caption)
                .foregroundStyle(.teal)
                .fontWeight(.semibold)
            Text("Préférences")
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
    }
}

#Preview {
    Header()
}

#Preview {
    PreferencesView()
}
