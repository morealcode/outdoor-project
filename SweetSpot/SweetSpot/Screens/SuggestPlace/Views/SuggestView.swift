//
//  SuggestView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct SuggestView: View {
    
    let styleLieux : StyleLieux
    
    var body: some View {
        
        VStack {
            
            CarousselView()
            
            ComparatifTpsTrajetView()
            
            LocationInterestView(styleLieux: styleLieux)
            
        }
        
    }
}

#Preview {
    SuggestView(styleLieux: StyleLieux.exemple[0])
}
