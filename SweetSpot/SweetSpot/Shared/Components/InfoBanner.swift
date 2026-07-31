//
//  InfoBanner.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct InfoBanner: View {
    
    var body: some View {
        
        HStack(spacing: 20) {
            Image(systemName: "lock.fill")
            
            Text("Seules les personnes avec ce lien pourront rejoindre et voir les détails de l’évènement.")
                .font(.footnote)
        }
        .foregroundStyle(Color(.accent))
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.accent).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    InfoBanner()
}
