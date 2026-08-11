//
//  LieuxCardView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct LieuxCardView: View {
    var body: some View {
        
        ScrollView {
        
            VStack {
                
                ForEach(Images.caroussel) { image in
                    HStack {
                        Image(image.image).resizable()
                            .frame(width: 370, height: 250)
                    
                            .overlay(alignment: .topLeading) {
                                Text("98% match")
                                    .font(.caption2.bold())
                                    .foregroundStyle(.black)
                                    .padding(6)
                                    .background(.white, in: Capsule())
                                    .padding(8)
                            }
                            .overlay (alignment: .topTrailing) {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.gray)
                                    .padding(6)
                                    .background(.white, in: Circle())
                                    .padding(8)
                            }
                            .overlay (alignment: .bottom) {
                                
                                VStack (alignment: .leading, spacing: 0){
                                    Text("Rooftop des Lumières")
                                        .font(.headline.bold())
                                        .foregroundStyle(.white)
                                        .padding(.vertical,0)
                                        .padding(.horizontal)
                                    
                                    Text("Rooftop · Paris 11")
                                        .font(.caption2)
                                        .foregroundStyle(.white)
                                        .padding(.vertical,5)
                                        .padding(.horizontal)
                                    
                                    HStack(alignment: .center, spacing: 2) {
                                            Image(systemName: "star.fill")
                                                .foregroundStyle(.yellow)
                                                .font(.caption2)
                                            Text("4.8")
                                            .font(.caption2.bold())
                                            Text("128 avis")
                                            .font(.caption2)
                                            .foregroundStyle(.gray)
                                            Image(systemName: "clock")
                                            .foregroundStyle(.gray)
                                            Text("12min")
                                                .font(.caption2)
                                                .foregroundStyle(.gray)
                                            Text("20-40€ /pers.")
                                                .font(.caption2.bold())
                                            Text("Végétarien")
                                                .font(.caption2.bold())
                                                .foregroundStyle(.black)
                                                .padding(6)
                                                .background(.red, in: Capsule())
                                                .padding(8)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 0)
                                    .padding(.horizontal, 10)
                                    .background(.white)
                                }
                            }
                            .clipShape(.rect(cornerRadius: 25))
                            .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 3)
                            
                    }
                    
                }
            }
        }
    }
        
    }


#Preview {
    LieuxCardView()
}
