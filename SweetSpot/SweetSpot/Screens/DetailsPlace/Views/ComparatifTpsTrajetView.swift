//
//  ComparatifTpsTrajetView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct ComparatifTpsTrajetView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // 1. Titre & sous-titre
            VStack(alignment: .leading, spacing: 2) {
                Text("Comparatif des temps de trajet")
                    .font(.subheadline)
                    .bold()

                Text("Basé sur votre position actuelle")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

           
            HStack(spacing: 0) {
                
               Spacer()

                HStack(spacing: 8) {
                    TransportHeaderIcon(icon: "car.fill", label: "Voiture")
                    TransportHeaderIcon(icon: "bus.fill", label: "Bus")
                    TransportHeaderIcon(icon: "bicycle", label: "Vélo")
                    TransportHeaderIcon(icon: "figure.walk", label: "À pied")
                }
            }
            .padding(.top, 4)

            Divider()

            VStack(spacing: 8) {
                ForEach(Participants.membre) { participant in
                    ParticipantRowView(participant: participant)
                    
                    if participant.id != Participants.membre.last?.id {
                        Divider()
                    }
                }
            }

            HStack(spacing: 10) {
                Image(systemName: "person.2.fill")
                    .font(.callout)
                    .foregroundColor(.mint)

                VStack(alignment: .leading, spacing: 1) {
                    Text("Heure d'arrivée groupée optimale : 19h15")
                        .font(.caption)
                        .bold()

                    Text("Écart maximal de 6 min entre tous les participants")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }

                Spacer(minLength: 0)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.mint.opacity(0.12))
            )
            .padding(.top, 4)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
}

struct TransportHeaderIcon: View {
    let icon: String
    let label: String

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: icon)
                .font(.system(size: 11))
            Text(label)
                .font(.system(size: 8, weight: .semibold))
        }
        .frame(width: 42)
    }
}

struct ParticipantRowView: View {
    let participant: Participants

    var body: some View {
        HStack(spacing: 0) {
    
            HStack(spacing: 6) {
                Image(systemName: "person.crop.circle")
                    .font(.title3)
                    .foregroundColor(.gray)

                VStack(alignment: .leading, spacing: 1) {
                    Text(participant.prenom)
                        .font(.caption)
                        .bold()

                    Text("Depuis le travail")
                        .font(.system(size: 9))
                        .foregroundStyle(.gray)
                }
            }

            Spacer()

            HStack(spacing: 10) {
                TimeBadge(icon: "car.fill", time: participant.carTime)
                TimeBadge(icon: "bus.fill", time: participant.busTime)
                TimeBadge(icon: "bicycle", time: participant.veloTime)
                TimeBadge(icon: "figure.walk", time: participant.walkTime)
                }
        }
    }
}

struct TimeBadge: View {
    let icon: String
    let time: Double

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: icon)
                .font(.system(size: 9))
                .foregroundColor(.gray)

            Text("\(Int(time))m")
                .font(.system(size: 10, weight: .semibold))
        }
    }
}

#Preview {
    ComparatifTpsTrajetView()
}

