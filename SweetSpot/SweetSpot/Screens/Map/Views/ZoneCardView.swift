//
//  ZoneCardView.swift
//  SweetSpot
//
//  Created by morealcode on 29/07/2026.
//

import SwiftUI

struct ZoneCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                Text("Hello")
            }
            
            HStack{
                Text("Hello")
            }
            
            Text("")
            
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.25), radius: 12, x: 0, y: 0)
        
    }
}

#Preview {
    VStack{
        ZoneCardView()
    }
    .padding()
}
