//
//  SummaryView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                DestinationRow()
                VoteRow()
                AttendeesRow()
            }
            .padding(.horizontal)
        }
        .background(.backgroundApp)
        
    }
}

#Preview {
    SummaryView()
}
