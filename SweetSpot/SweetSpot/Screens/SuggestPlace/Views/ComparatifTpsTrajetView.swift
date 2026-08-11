//
//  ComparatifTpsTrajetView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct ComparatifTpsTrajetView: View {
    var body: some View {
        
        VStack(spacing: 8) {
            
            HStack(spacing: 0) {
                
                VStack(spacing: 8) {
                    
                    VStack(alignment: .leading ,spacing: 0){
                        Text("Comparatif des temps de trajet")
                            .bold()
                        
                        Text("Basé sur votre position actuelle")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack(alignment: .lastTextBaseline,spacing: 30){
                        Spacer()
                        VStack{
                            Image(systemName: "car.fill")
                            Text("Voiture")
                                .bold()
                                .font(.system(size: 9))
                        }
                        VStack{
                            Image(systemName: "bus.doubledecker")
                            Text("Bus")
                                .bold()
                                .font(.system(size: 9))
                        }
                        VStack{
                            Image(systemName: "bicycle")
                            Text("Vélo")
                                .bold()
                                .font(.system(size: 9))
                        }
                        VStack{
                            Image(systemName: "figure.walk")
                            Text("A pied")
                                .bold()
                                .font(.system(size: 9))
                        }
                    }
                    .padding(.horizontal)
                    
                    List {
                        
                        ForEach(Participants.membre) { participant in
                            
                            HStack (alignment: .center, spacing: 5) {
                                
                                Image(systemName: "person.crop.circle")
                                    .font(.title)
                                    .padding(.horizontal)
                                
                                VStack{
                                    Text("\(participant.prenom)")
                                        .font(.caption2)
                                        .bold()
                                    Text("Depuis le travail")
                                        .foregroundStyle(.gray)
                                }
                                
                                Image(systemName: "car.fill")
                                Text("\(participant.carTime, format: .number) min")
                                Image(systemName: "bus.fill")
                                Text("\(participant.busTime, format: .number) min")
                                Image(systemName: "bicycle")
                                Text("\(participant.veloTime, format: .number) min")
                                Image(systemName: "figure.walk")
                                Text("\(participant.walkTime, format: .number) min")
                                
                            }
                            .frame(maxHeight: 20)
                            .font(.system(size: 8))
                            .alignmentGuide(.listRowSeparatorLeading) { _ in
                                return 0 // Aligne le separateur sur le bord avant
                            }
                        }
                        HStack( spacing: 12) {
                            Image (systemName: "person.2")
                                .foregroundColor(.mint)
                            
                            VStack (alignment: .leading, spacing: 2){
                                Text("Heure d'arrivée groupé optimal : 19h15")
                                    .bold()
                                Text("Ecart maximal de 6 min entre tous les participants")
                                    .foregroundColor(.gray)
                            }
                            .font(.system(size:10))
                            .padding()
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 10)
                        .frame(width: 358, height: 36)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.mint).opacity(0.1)
                        )
                        
                    }
                    .scrollContentBackground(.hidden)
                    
                    
                    
                    
                    
                    
                }
                
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            .frame(width: 378, height: 241)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 3)
            )
            
            
        }
    }
}

#Preview {
    ComparatifTpsTrajetView()
}
