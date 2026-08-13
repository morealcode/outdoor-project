//
//  DetailsPlaceView.swift
//  SweetSpot
//
//  Created by apprenant144 on 11/08/2026.
//

import SwiftUI

struct SuggestPlaceView: View {

    let group: MeetupGroup

    @State private var selectedPlaceID: UUID?

    private var lieux: [Place] {
        group.event.suggestedPlaces
    }

    var body: some View {

        NavigationStack {
            VStack(spacing: 16) {

                TypeChoiceView()
                    .padding(.horizontal, 8)

                ScrollView {
                    VStack(spacing: 12) {

                        ForEach(lieux) { lieu in

                            NavigationLink(
                                destination: DetailsPlaceView(
                                    styleLieux: StyleLieux.exemple[0]
                                )
                            ) {
                                LieuxCardView(
                                    lieu: lieu,
                                    isSelected: selectedPlaceID == lieu.id,
                                    onSelect: {
                                        toggleSelection(for: lieu)
                                    }
                                )
                                .padding(.horizontal, 8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                PrimaryButton(
                    title: "Vote pour le lieu de ton choix",
                    systemImage: "checkmark.circle.fill",
                    action: voteForSelectedPlace
                )
                .disabled(selectedPlaceID == nil)
                .opacity(
                    selectedPlaceID == nil
                        ? 0.5
                        : 1
                )
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 8)
            .background(.backgroundApp)
        }
    }

    // MARK: - Selection

    private func toggleSelection(
        for place: Place
    ) {
        if selectedPlaceID == place.id {
            selectedPlaceID = nil
        } else {
            selectedPlaceID = place.id
        }
    }

    // MARK: - Vote

    private func voteForSelectedPlace() {

        guard
            let selectedPlaceID,
            let chosenPlace = lieux.first(
                where: { $0.id == selectedPlaceID }
            )
        else {
            return
        }

        print(
            "🗳️ Lieu sélectionné pour \(group.name) : \(chosenPlace.name)"
        )
    }
}

// MARK: - Preview

#Preview {
    SuggestPlacePreview()
}

private struct SuggestPlacePreview: View {

    @State private var group: MeetupGroup?
    @State private var isLoading = true

    var body: some View {

        Group {

            if isLoading {

                ProgressView(
                    "Chargement des lieux..."
                )

            } else if let group {

                SuggestPlaceView(
                    group: group
                )

            } else {

                ContentUnavailableView(
                    "Aucun groupe",
                    systemImage: "person.3"
                )
            }
        }
        .task {
            await loadPreview()
        }
    }

    private func loadPreview() async {

        isLoading = true

        group = await MockDataV2.makeProjectGroup()

        isLoading = false
    }
}
