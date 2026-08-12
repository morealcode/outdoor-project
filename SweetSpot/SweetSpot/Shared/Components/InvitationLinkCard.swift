//
//  InvitationLinkCard.swift
//  SweetSpot
//
//  Created by apprenant120 on 04/08/2026.
//

import SwiftUI

struct InvitationLinkCard: View {
    
    let invitationLink: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: "link")
                    .font(.headline)
                    .foregroundStyle(.accent)
                
                Text("Lien d'invitation à partager")
                    .font(.headline)
            }
            
            HStack {
                Text(invitationLink)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .padding(.leading, 30)
                
                Spacer()
                
                if let url = URL(string: invitationLink) {
                    ShareLink(
                        item: url,
                        subject: Text("Invitation Sweetspot"),
                        message: Text("Rejoins mon évènement sur sweespot !")
                    ) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.1), radius: 8)
    }
}

#Preview {
    InvitationLinkCard(invitationLink: "https://sweetspot.app/join/ABC12345")
}
