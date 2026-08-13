//
//  DetailsPlaceView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct SuggestPlaceView: View {
    
    let lieux: [Lieu] = Lieu.samples
    @State private var selectedLieuID: UUID? = nil
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 16) {
                
                TypeChoiceView()
                    .padding(.horizontal, 8)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(lieux) { lieu in
                            NavigationLink(destination: DetailsPlaceView(styleLieux: StyleLieux.exemple[0])){
                                LieuxCardView(
                                    lieu: lieu,
                                    isSelected: selectedLieuID == lieu.id,
                                    onSelect: {
                                        if selectedLieuID == lieu.id {
                                            selectedLieuID = nil
                                        } else {
                                            selectedLieuID = lieu.id
                                        }
                                    }
                                )
                                .padding(.horizontal, 8)
                            }
                        }
                    }
                }
                
                PrimaryButton(
                    title: "Vote pour le lieu de ton choix",
                    systemImage: "checkmark.circle.fill",
                    action: {
                        if let selectedID = selectedLieuID,
                           let chosenLieu = lieux.first(where: { $0.id == selectedID }) {
                            print("Lieu sélectionné : \(chosenLieu.name)")
                        }
                    }
                )
                .disabled(selectedLieuID == nil)
                .opacity(selectedLieuID == nil ? 0.5 : 1.0)
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 8)
            .background(.backgroundApp)
        }
    }
}
#Preview {
    SuggestPlaceView()
}
