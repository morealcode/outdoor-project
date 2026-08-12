//
//  DetailsPlaceView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct SuggestPlaceView: View {
    
    let lieux: [Lieu] = Lieu.samples
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing:16) {
                
                TypeChoiceView()
                    .padding(.horizontal,8)
                
                ForEach(lieux) { lieu in
                    LieuxCardView(lieu: lieu)
                        .padding(.horizontal,8)
                }
            }
        }
        .padding(.vertical, 8)
        .background(.backgroundApp)
    }
}

#Preview {
    SuggestPlaceView()
}

