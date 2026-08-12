//
//  TypeChoiceView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct TypeChoiceView: View {
    var body: some View {
    
        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            Text("Lieux suggérés")
                .font(.title2.bold())

        }
        
        ScrollView(.horizontal, showsIndicators: false) {
                   HStack(spacing: 12) {
                       ForEach(LocationType.arrOfLocationType) { type in
                           HStack(spacing: 8) {
                               Image(systemName: type.symbol)
                                   .font(.system(size: 16, weight: .medium))
                                   .foregroundStyle(type.color)
                               
                               Text(type.name)
                                   .font(.system(size: 16, weight: .semibold))
                                   .foregroundStyle(Color(red: 0.2, green: 0.25, blue: 0.35))
                           }
                           .padding(.horizontal, 20)
                           .padding(.vertical, 12)
                           .background(
                               RoundedRectangle(cornerRadius: 100)
                                   .stroke(Color(red: 0.9, green: 0.92, blue: 0.95), lineWidth: 1.5)
                           )
                       }
                   }
                   .padding(.horizontal)
               }
    }
}

#Preview {
    TypeChoiceView()
}
