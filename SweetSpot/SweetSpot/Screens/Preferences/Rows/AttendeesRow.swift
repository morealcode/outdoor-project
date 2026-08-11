//
//  AttendeesRows.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct AttendeesRow: View {
    var body: some View {
        VStack {
            HStack {
                Text("Participants")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                HStack(spacing: 0){
                    Circle()
                        .fill(.green)
                        .frame(width: 40, height: 40)
                        .overlay(alignment: .center){
                            Text("A")
                                .foregroundStyle(.white)
                        }
                    Circle()
                        .fill(.purple)
                        .frame(width: 40, height: 40)
                        .background(.white, in: .circle.stroke(lineWidth: 5))
                        .overlay(alignment: .center){
                            Text("H")
                                .foregroundStyle(.white)
                        }
                        .offset(x: -5)
               
                    Circle()
                        .fill(.orange)
                        .frame(width: 40, height: 40)
                        .background(.white, in: .circle.stroke(lineWidth: 5))
                        .overlay(alignment: .center) {
                            Text("G")
                                .foregroundStyle(.white)
                        }
                        .offset(x: -10)
                       
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.secondary).opacity(0.4)
            }

        }
    }
}

#Preview {
    AttendeesRow()
}

#Preview {
    RecapitulatifView()
}
