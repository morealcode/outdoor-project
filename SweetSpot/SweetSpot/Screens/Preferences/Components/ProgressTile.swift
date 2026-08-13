//
//  ProgressTile.swift
//  projetGroupe2
//
//  Created by Guillaume Richard on 29/07/2026.
//

import SwiftUI

struct ProgressTile: View {
    var note: CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 150, height: 8)
                .foregroundStyle(.teal.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: note * 15, height: 8)
                .foregroundStyle(.teal.opacity(0.8))
        }
    }
}

#Preview {
    ProgressTile(note: 9)
}
