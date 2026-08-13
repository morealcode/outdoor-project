//
//  VoteRow.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct VoteRow: View {
    var body: some View {
        VStack {
            HStack {
                Text("Résumé du vote")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .center){
                HStack(alignment: .center, spacing: 30){
                    Text("Vote du groupe")
                    
                    VStack(spacing: 20){
                        ProgressTile(note: 9)
                        ProgressTile(note: 7)
                        ProgressTile(note: 4)
                    }
                }
               
            }
            .frame(maxWidth: .infinity)
            //            .frame(height: 230)
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
    VoteRow()
}
