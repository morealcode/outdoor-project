//
//  PersonMarkerView.swift
//  SweetSpot
//
//  Created by morealcode on 09/08/2026.
//

import SwiftUI

struct PersonMarkerView: View {

    var body: some View {
        Image(systemName: "person.fill")
            .foregroundStyle(.white)
            .padding(10)
            .background(.accent)
            .clipShape(Circle())
            .shadow(color: .indigo.opacity(0.3), radius: 8)
    }
}

#Preview {
    PersonMarkerView()
}
