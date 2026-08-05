//
//  NewEventView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct NewEventView: View {
    
    @Environment(AppStore.self) private var store
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel = NewEventViewModel()
    
    let groupID: UUID
    
    var body: some View {
       
        ScrollView {
            VStack(spacing: 16) {
                
                illustration
                titleSection
                eventNameField
                
                EventDateAndTimeCard()
                
                InvitationLinkCard()
                
                InfoBanner()
                
                PrimaryButton(
                    title: "Créer l'évènement",
                    systemImage: "chevron.right"
                ) {
                    let event = viewModel.createEvent()
                    
                    store.createEvent(event, for: groupID)
                    
                    dismiss()
                }
                .disabled(!viewModel.isFormValid)
            }
            .padding()
        }
        .overlay(alignment: .topLeading) {
            header
        }
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden()
    }
}

private extension NewEventView {
    var header: some View {
        
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.headline)
                    .padding()
            }

            Spacer()
        }
    }
}

private extension NewEventView {
    var illustration: some View {
        
        Image("newEventHeader")
            .resizable()
            .scaledToFit()
            .frame(height: 150)
    }
}

private extension NewEventView {
    var titleSection: some View {
        
        VStack(spacing: 8) {
            Text("Créer un évènement")
                .font(.system(size: 38, weight: .bold))
            
            Text("Planifions le meilleur point de rencontre pour tout le monde.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

private extension NewEventView {
    var eventNameField: some View {
        
        CustomTextField(
            text: $viewModel.eventName,
            title: "Nom de l'évènement",
            placeholder: "Ex : Soirée d'anniversaire Lucas"
        )
    }
}

#Preview {
    
    let store = MockData.makeStore()
    
    NavigationStack {
        NewEventView(groupID: UUID())
    }
    .environment(store)
}
