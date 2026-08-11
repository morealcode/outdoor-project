//
//  TempsTrajet.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct TempsTrajet: View {
    var body: some View {
       
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
            
        }

    }
}

#Preview {
    TempsTrajet()
}
