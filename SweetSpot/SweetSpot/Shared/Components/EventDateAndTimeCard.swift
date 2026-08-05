//
//  EventDateCard.swift
//  SweetSpot
//
//  Created by apprenant120 on 04/08/2026.
//

import SwiftUI

struct EventDateAndTimeCard: View {
    
    @State private var viewModel = NewEventViewModel()
    @State private var showDatePicker = false
    @State private var showTimePicker = false
    
    var body: some View {
        
        HStack {
            Button {
                showDatePicker.toggle()
            } label: {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.title3)
                            .foregroundStyle(.accent)
                        
                        Text("Date")
                            .font(.headline)
                    }
                    
                    Text(viewModel.selectedDate.formatted(date: .numeric, time: .omitted))
                        .foregroundStyle(.secondary)
                        .padding(.leading, 32)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: .black.opacity(0.1), radius: 8)
            }
            .buttonStyle(.plain)
            
            Button {
                showTimePicker.toggle()
            } label: {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "clock")
                            .font(.title3)
                            .foregroundStyle(.accent)
                        
                        Text("Heure")
                            .font(.headline)
                    }
                    
                    Text(viewModel.selectedDate.formatted(date: .omitted, time: .shortened))
                        .foregroundStyle(.secondary)
                        .padding(.leading, 32)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: .black.opacity(0.1), radius: 8)
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $showDatePicker) {
            NavigationStack {
                VStack {
                    DatePicker("Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                .padding()
                .navigationTitle("Choisir une date")
                
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Terminé") {
                            showDatePicker = false
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showTimePicker) {
            NavigationStack {
                VStack {
                    DatePicker("Heure", selection: $viewModel.selectedDate, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                }
                .padding()
                .navigationTitle("Choisir une Heure")
                
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Terminé") {
                            showTimePicker = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    
    EventDateAndTimeCard()
}
