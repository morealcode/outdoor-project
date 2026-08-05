//
//  GroupView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI

struct GroupView: View {
    @Environment(AppStore.self) private var store
    
    @State private var viewModel: GroupViewModel
    @State private var selectedTab = 0
    @State private var showEditEvent =  false
    
    init(
        store: AppStore,
        groupID: UUID
    ) {
        _viewModel = State(
            initialValue: GroupViewModel(
                store: store,
                groupID: groupID
            )
        )
    }

    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                if let event = viewModel.event {
                    EventCard(event: event) {
                        showEditEvent = true
                    }
                }
                
                DashboardGrid(viewmodel: viewModel)
                
                participantSection
                bottomButtons
                
                PrimaryButton(
                    title: "Voir les détails de l'évènement",
                    systemImage: "chevron.right"
                ) {
                    
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.group?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarMenu
        }
    }
}

private extension GroupView {
    
    @ToolbarContentBuilder
    var toolbarMenu: some ToolbarContent {
        
        ToolbarItem(placement: .topBarTrailing) {
            Menu {
                Button {
                    
                } label: {
                    Label(
                        "Copier le code",
                        systemImage: "doc.on.doc"
                    )
                }
                
                Button {
                    
                } label: {
                    Label(
                        "Partager",
                        systemImage: "square.and.arrow.up"
                    )
                }

                Divider()
                
                Button {
                    
                } label: {
                    Label(
                        "Supprimer le groupe",
                        systemImage: "trash"
                    )
                }
            } label: {
                Image(systemName: "ellipsis")
            }
        }
    }
}

private extension GroupView {
    
    var participantSection: some View {
        
        VStack(spacing: 18) {
            SegmentedPicker(selection: $selectedTab)
            
            if selectedTab == 0 {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.participants) {
                        ParticipantRow(participant: $0)
                    }
                }
            }
            else {
                ContentUnavailableView(
                    "Activité",
                    systemImage: "fork.knife",
                    description: Text(
                        "Cette partie sera développée prochainement"
                    )
                )
            }
        }
    }
}

private extension GroupView {
    
    var bottomButtons: some View {
        
        HStack(spacing: 12) {
            PrimaryButton(
                title: "Inviter",
                systemImage: "person.badge.plus"
            ) {
                
            }
            
            PrimaryButton(
                title: "Relancer",
                systemImage: "paperplane.fill"
            ) {
                
            }
            
            PrimaryButton(
                title: "Carte",
                systemImage: "map.fill"
            ) {
                
            }
        }
    }
}

#Preview {
    let store = MockData.makeStore()

    NavigationStack {
        GroupView(
            store: store,
            groupID: store.groups.first!.id
        )
    }
    .environment(store)
}
