//
//  CarousselView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct CarousselView: View {
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            Text("Détails du lieu")
                .font(.title2.bold())

        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Images.caroussel) { image in
                    HStack {
                        Image(image.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 150)
                            .clipShape(.rect(cornerRadius: 20))
                            .scrollTransition { content, phase in
                                           content
                                    .opacity(phase.isIdentity ? 1 : 0.6)
                                               .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                               .blur(radius: phase.isIdentity ? 0 : 4)
                                       }
                    }
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    CarousselView()
}


