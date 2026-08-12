//
//  PlaceView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct PlaceView: View {
    
    let lieu: LieuDetail = .exemple
    @State private var isFavorite: Bool = false
    
    private let primaryPurple = Color(red: 0.55, green: 0.38, blue: 0.98)
    private let lightPurple = Color(red: 0.92, green: 0.88, blue: 0.99)
    private let tealThumb = Color(red: 0.25, green: 0.72, blue: 0.70)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text(lieu.nom)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .font(.title2)
                            .foregroundColor(isFavorite ? .yellow : .gray)
                    }
                }
                
                Text(lieu.categorie)
                    .font(.caption)
                    .bold()
                    .foregroundColor(primaryPurple)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(lightPurple)
                    )
                
                HStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "star")
                            .foregroundColor(primaryPurple)
                            .font(.caption)
                        
                        Text(String(format: "%.1f", lieu.note))
                            .font(.caption)
                            .bold()
                        
                        Text("(\(lieu.nombreAvis) avis)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Text("|")
                        .font(.caption)
                        .foregroundColor(.gray.opacity(0.4))
                    
                    HStack(spacing: 4) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(tealThumb)
                            .font(.caption)
                        
                        Text("\(lieu.pourcentageRecommandation)% recommandent")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            VStack(spacing: 0) {
                
                DetailRowView(
                    icon: "clock",
                    title: "Horaire",
                    detail: lieu.horaire,
                    primaryPurple: primaryPurple,
                    trailingIcon: "chevron.down"
                )
                
                Divider()
                
                DetailRowView(
                    icon: "eurosign",
                    title: "Budget moyen",
                    detail: lieu.budget,
                    primaryPurple: primaryPurple,
                    trailingText: lieu.niveauBudget
                )
                
                Divider()
                
                DetailRowView(
                    icon: "mappin",
                    title: "Adresse",
                    detail: lieu.adresse,
                    primaryPurple: primaryPurple,
                    trailingIcon: "paperplane"
                )
                
                Divider()
                
                DetailRowView(
                    icon: "info",
                    title: "Infos clés",
                    detail: lieu.infosCles,
                    primaryPurple: primaryPurple
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
            )
        }
        .padding(.horizontal)
    }
}

#Preview {
    PlaceView()
}
