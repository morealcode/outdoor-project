//
//  CustomTextField.swift
//  SweetSpot
//
//  Created by apprenant120 on 30/07/2026.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    
    let title: String
    let placeholder: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            
            TextField(placeholder, text: $text)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 3)
    }
}

#Preview {
    
    ZStack {
        
        Color(.backgroundApp)
            .ignoresSafeArea()
        
        CustomTextField(text: .constant(""), title: "Nom de l’évènement", placeholder: "Ex : Soirée d’anniversaire de Lucas")
    }
}
