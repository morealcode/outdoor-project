//
//  SuggestView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct DetailsPlaceView: View {
    
    let styleLieux : StyleLieux
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20) {
                
                CarousselView()
                
                PlaceView()
                
                ComparatifTpsTrajetView()
                
                LocationInterestView(styleLieux: styleLieux)
            }
            .padding()
        }
        .background(.backgroundApp)
    }
}

#Preview {
    DetailsPlaceView(styleLieux: StyleLieux.exemple[0])
}

