//
//  TransportRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 28/07/2026.
//

import SwiftUI

struct TransportRow: View {
    @State private var selected = ""
    var body: some View {
        VStack {
            HStack {
                Text("Transport préféré")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 20){
                Button {
                    selected = "tram.fill"
                } label: {
                    TransportTile(
                        
                        iconTransport: "tram.fill",
                        nameTransport: "Transport",
                        selected: $selected
                    )
                }
                
                Button {
                    selected = "car.fill"
                    
                } label: {
                    TransportTile(
                        iconTransport: "car.fill",
                        nameTransport: "Voiture",
                        selected: $selected
                    )
                    
                }
                
                Button {
                    selected = "bicycle"
                    
                } label: {
                    TransportTile(
                        iconTransport: "bicycle",
                        nameTransport: "Vélo",
                        selected: $selected
                    )
                    
                }
                
                Button {
                    selected = "figure.walk"
                } label: {
                    TransportTile(
                        iconTransport: "figure.walk",
                        nameTransport: "À pieds",
                        selected: $selected
                    )
                }
                
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    TransportRow()
}

#Preview {
    PreferencesView()
}
