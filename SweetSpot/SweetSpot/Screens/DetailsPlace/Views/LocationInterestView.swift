//
//  LocationInterestView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct LocationInterestView: View {
    
    let styleLieux : StyleLieux
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("Pourquoi ce lieux")
                            .font(.body)
                            .foregroundColor(.black)
                        
                        HStack {
                            ForEach(StyleLieux.exemple) { exemple in
                                
                                HStack(spacing: 0) {
                                    
                                    Image(systemName: exemple.iconName)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                    
                                    VStack(spacing: 4) {
                                        
                                        Text(exemple.nom)
                                            .font(.system(size: 8))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        Text(exemple.description)
                                            .font(.system(size: 7))
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                .frame(width: 86, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 3)
                                )
                            }
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .frame(width: 378, height: 84)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 3)
                    )
                }
            }
        }
    }
}

#Preview {
    LocationInterestView(styleLieux: StyleLieux.exemple[0])
}

