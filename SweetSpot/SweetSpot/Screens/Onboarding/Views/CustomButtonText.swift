//
//  CustomButton.swift
//  SweetSpot
//
//  Created by morealcode on 11/08/2026.
//

import SwiftUI

struct CustomButtonText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(
                LinearGradient(
                    colors: [
                        Color(.accent),
                        Color(.accentBlue),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
    }
}

#Preview {
    CustomButtonText(text: "Continuer")
}
