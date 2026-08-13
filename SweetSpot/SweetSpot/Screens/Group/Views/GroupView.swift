//
//  GroupView.swift
//  SweetSpot
//
//  Created by morealcode on 28/07/2026.
//

import SwiftUI
import UIKit

struct GroupView: View {

    @Environment(AppStore.self) private var store
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: GroupViewModel
    @State private var selectedTab = 0
    @State private var showEditEvent = false
    @State private var showVoteView = false
    @State private var showEventDetails = false
    @State private var showConfirmation = false
    @State private var showDelete = false

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

        VStack(spacing: 16) {
            if let event = viewModel.event {
                EventCard(event: event) {
                    showEditEvent = true
                }
            }

            DashboardGrid(viewmodel: viewModel)

            participantSection

            Spacer()

            bottomButtons

            PrimaryButton(
                title: "Voir les détails de l'évènement",
                systemImage: "chevron.right"
            ) {
                showEventDetails = true
            }
        }
        .padding()
        .navigationTitle(viewModel.group?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showVoteView) {
            if let group = viewModel.group {
                SuggestPlaceView(group: group)
            }
        }
        .navigationDestination(isPresented: $showEventDetails) {
            SummaryView()
        }
        .navigationDestination(isPresented: $showEditEvent) {
            if let event = viewModel.event,
                let groupID = viewModel.group?.id
            {
                NewEventView(
                    groupID: groupID,
                    event: event
                )
            }
        }
        .alert("Relance envoyée", isPresented: $showConfirmation) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(
                "Une notification a été envoyé aux participants qui n'ont pas encore répondu."
            )
        }
        .confirmationDialog(
            "Supprimer ce groupe ?",
            isPresented: $showDelete,
            titleVisibility: .visible
        ) {
            Button("Supprimer le groupe", role: .destructive) {
                deleteGroup()
            }

            Button("Annuler", role: .cancel) {}

        } message: {
            Text(
                "Cette action supprimera définitivement le groupe et ses données."
            )
        }
        .toolbar {
            toolbarMenu
        }
    }
}

extension GroupView {

    @ToolbarContentBuilder
    fileprivate var toolbarMenu: some ToolbarContent {

        ToolbarItem(placement: .topBarTrailing) {
            Menu {
                Button {
                    copyInvitationCode()
                } label: {
                    Label(
                        "Copier le code",
                        systemImage: "doc.on.doc"
                    )
                }

                ShareLink(
                    item: viewModel.invitationLink,
                    subject: Text("Invitation SweetSpot"),
                    message: Text(
                        "Rejoins mon groupe sur SweetSpot !"
                    )
                ) {
                    Label(
                        "Partager",
                        systemImage: "square.and.arrow.up"
                    )
                }

                Divider()

                Button(role: .destructive) {
                    showDelete = true
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

extension GroupView {

    fileprivate var participantSection: some View {

        VStack(spacing: 18) {
            SegmentedPicker(selection: $selectedTab)

            ScrollView {
                if selectedTab == 0 {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.participants) { participant in
                            ParticipantRow(participant: participant)
                        }
                    }
                } else {
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
}

extension GroupView {

    fileprivate func deleteGroup() {
        store.deleteGroup(viewModel.id)
        dismiss()
    }
}

extension GroupView {

    fileprivate func copyInvitationCode() {
        UIPasteboard.general.string = viewModel.invitationLink
    }
}

extension GroupView {

    fileprivate var bottomButtons: some View {

        HStack(spacing: 12) {
            ShareLink(
                item: viewModel.invitationLink
            ) {

                HStack(spacing: 8) {

                    Text("Inviter")
                        .font(.headline)
                        .fontWeight(.semibold)

                    Image(systemName: "person.badge.plus")

                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 49)
                .background(
                    LinearGradient(
                        colors: [
                            Color(.accent),
                            Color(.accentBlue),
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            }

            PrimaryButton(
                title: "Relancer",
                systemImage: "paperplane.fill"
            ) {
                showConfirmation = true
            }

            PrimaryButton(
                title: "Voter",
                systemImage: "checkmark.circle"
            ) {
                showVoteView = true
            }
        }
    }
}

#Preview("V2") {
    GroupViewPreview()
}

private struct GroupViewPreview: View {

    @State private var store: AppStore?

    var body: some View {
        Group {
            if let store {
                NavigationStack {
                    GroupView(
                        store: store,
                        groupID: store.groups.first!.id
                    )
                }
                .environment(store)
            } else {
                ProgressView("Chargement...")
            }
        }
        .task {
            store = await MockDataV2.makeStore()
        }
    }
}

#Preview("V1") {
    let store = MockData.makeStore()

    NavigationStack {
        GroupView(
            store: store,
            groupID: store.groups.first!.id
        )
    }
    .environment(store)
}
