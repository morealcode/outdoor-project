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

    let groupID: UUID?

    @State private var viewModel: NewEventViewModel?

    init(
        groupID: UUID? = nil
    ) {
        self.groupID = groupID
    }

    var body: some View {
        Group {

            if let viewModel {

                eventContent(
                    viewModel: viewModel
                )

            } else {

                ProgressView(
                    "Chargement..."
                )
            }
        }
        .task {
            setupViewModel()
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Content

extension NewEventView {

    @ViewBuilder
    fileprivate func eventContent(
        viewModel: NewEventViewModel
    ) -> some View {

        @Bindable var viewModel = viewModel

        ScrollView {
            VStack(spacing: 16) {

                illustration

                titleSection(
                    isEditing: viewModel.isEditing
                )

                CustomTextField(
                    text: $viewModel.eventName,
                    title: "Nom de l'évènement",
                    placeholder: "Ex : Anniversaire Lucas"
                )

                EventDateAndTimeCard(
                    selectedDate: $viewModel.selectedDate
                )

                InvitationLinkCard(
                    invitationLink: viewModel.invitationLink
                )

                InfoBanner()

                PrimaryButton(
                    title: viewModel.isEditing
                        ? "Enregistrer les modifications"
                        : "Créer l'évènement",
                    systemImage: viewModel.isEditing
                        ? "checkmark"
                        : "chevron.right"
                ) {
                    saveEvent(
                        with: viewModel
                    )
                }
                .disabled(
                    !viewModel.isFormValid
                )
                .opacity(
                    viewModel.isFormValid
                        ? 1
                        : 0.5
                )
            }
            .padding()
        }
        .scrollIndicators(.hidden)
        .overlay(
            alignment: .topLeading
        ) {
            header
        }
    }
}

// MARK: - Setup

extension NewEventView {

    fileprivate func setupViewModel() {

        guard viewModel == nil else {
            return
        }

        viewModel = NewEventViewModel(
            store: store,
            groupID: groupID
        )
    }
}

// MARK: - Save

extension NewEventView {

    fileprivate func saveEvent(
        with viewModel: NewEventViewModel
    ) {

        guard viewModel.isFormValid else {
            return
        }

        viewModel.save()

        dismiss()
    }
}

// MARK: - Header

extension NewEventView {

    fileprivate var header: some View {
        HStack {

            Button {
                dismiss()
            } label: {
                Image(
                    systemName: "chevron.left"
                )
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
            }

            Spacer()
        }
    }
}

// MARK: - Illustration

extension NewEventView {

    fileprivate var illustration: some View {
        Image("newEventHeader")
            .resizable()
            .scaledToFit()
            .frame(height: 150)
    }
}

// MARK: - Title

extension NewEventView {

    fileprivate func titleSection(
        isEditing: Bool
    ) -> some View {

        VStack(spacing: 8) {

            Text(
                isEditing
                    ? "Modifier l'évènement"
                    : "Créer un évènement"
            )
            .font(
                .system(
                    size: 38,
                    weight: .bold
                )
            )

            Text(
                isEditing
                    ? "Modifiez les informations de votre évènement."
                    : "Planifions le meilleur point de rencontre pour tout le monde."
            )
            .font(.body)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
    }
}

// MARK: - Preview

#Preview("Création") {
    NewEventViewPreview(
        mode: .create
    )
}

#Preview("Modification") {
    NewEventViewPreview(
        mode: .edit
    )
}

private struct NewEventViewPreview: View {

    enum Mode {
        case create
        case edit
    }

    let mode: Mode

    @State private var store: AppStore?

    var body: some View {
        Group {

            if let store {

                NavigationStack {

                    switch mode {

                    case .create:

                        NewEventView()

                    case .edit:

                        if let group = store.groups.first {
                            NewEventView(
                                groupID: group.id
                            )
                        } else {
                            ContentUnavailableView(
                                "Aucun groupe",
                                systemImage: "person.3"
                            )
                        }
                    }
                }
                .environment(store)

            } else {

                ProgressView(
                    "Chargement..."
                )
            }
        }
        .task {
            store = await MockDataV2.makeStore()
        }
    }
}
