//
//  DetailsRowView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct DetailRowView: View {
    let icon: String
        let title: String
        let detail: String
        let primaryPurple: Color
        var trailingIcon: String? = nil
        var trailingText: String? = nil
    
    var body: some View {
        HStack(spacing: 12) {
                    
                    Image(systemName: icon)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(primaryPurple)
                        .frame(width: 28, height: 28)
                        .background(
                            Circle()
                                .stroke(primaryPurple.opacity(0.4), lineWidth: 1.5)
                        )
                    
                    Text(title)
                        .font(.caption)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 8)
                    
                    Text(detail)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)
                    
                    if let trailingIcon = trailingIcon {
                        Image(systemName: trailingIcon)
                            .font(.caption)
                            .bold()
                            .foregroundColor(primaryPurple)
                    }
                    
                    if let trailingText = trailingText {
                        Text(trailingText)
                            .font(.callout)
                            .bold()
                            .foregroundColor(primaryPurple)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
            }
        }

#Preview {
    DetailRowView(
        icon: "clock",
                title: "Horaire",
                detail: "Aujourd’hui · 18h00 - 1h00",
                primaryPurple: Color(red: 0.55, green: 0.38, blue: 0.98),
                trailingIcon: "chevron.down"
            )
            .padding()
}

