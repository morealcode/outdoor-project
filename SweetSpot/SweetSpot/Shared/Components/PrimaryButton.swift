//
//  PrimaryButton.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct PrimaryButton: View {
    
    let title: String
    let systemImage: String?
    let action: () -> Void
    
    var fullWidth: Bool = true
    
    var body: some View {
        
        Button(action: action) {
            HStack(spacing: 8) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                if let systemImage {
                    Image(systemName: systemImage)
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .frame(height: 49)
            .background(
                LinearGradient(
                    colors: [
                        Color(.accent),
                        Color(.accentBlue)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    PrimaryButton(
        title: "Créer l'évènement",
        systemImage: "chevron.right", action: {}
    )
}
