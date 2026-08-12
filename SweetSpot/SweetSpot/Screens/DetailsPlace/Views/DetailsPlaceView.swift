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
            
            CarousselView()
            
            PlaceView()
            
            ComparatifTpsTrajetView()
            
            LocationInterestView(styleLieux: styleLieux)
            
        }
        .background(.backgroundApp)
        .padding()
        
    }
}

#Preview {
    DetailsPlaceView(styleLieux: StyleLieux.exemple[0])
}

