//
//  CarousselView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct CarousselView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(Images.caroussel) { image in
                    HStack {
                        Image(image.image).resizable()
                            .frame(width: 290, height: 150)
                            .clipShape(.rect(cornerRadius: 25))
                            .scrollTransition { content, phase in
                                           content
                                               .opacity(phase.isIdentity ? 1 : 0)
                                               .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                               .blur(radius: phase.isIdentity ? 0 : 10)
                                       }
                            .frame(maxWidth: .infinity)
                    }
                    
                }
            }
        }
        .padding(50)
    }
}

#Preview {
    CarousselView()
}
