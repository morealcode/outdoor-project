# SweetSpot

A native iOS application built with **SwiftUI** for discovering places and organizing outings with other people.

SweetSpot brings together places, events, participants, transportation, location data, and activity preferences into a structured mobile experience.

## Overview

Planning an outing involves more than choosing a destination.

You need to decide **where to go, when to meet, who is joining, and how everyone gets there**.

SweetSpot explores this problem through a native iOS application designed around places, events, groups, participants, transportation, cuisine preferences, and geographic information.

## Core Concepts

The application models several aspects of organizing an outing:

* 📍 Places
* 📅 Events
* 👥 Groups and participants
* 🚗 Transportation
* 🌍 Geographic positions
* 🍽️ Cuisine preferences
* 🗓️ Days and scheduling
* 👤 Users
* 🚀 Onboarding

## Features

* Browse and explore places
* Access detailed place information
* Organize outings around events
* Manage participants and groups
* Represent transportation options
* Work with geographic/location information
* Handle cuisine and activity preferences
* Onboarding experience
* Reusable SwiftUI components
* Centralized application state through dedicated stores

## Project Structure

The application is organized by domain and responsibility:

```text
SweetSpot/
├── Models/
│   ├── Cuisine/
│   ├── Days/
│   ├── Event/
│   ├── Geoposition/
│   ├── Group/
│   ├── OnboardingPage/
│   ├── Participant/
│   ├── Place/
│   ├── Transport/
│   └── User/
├── Screens/
│   └── DetailsPlace/
├── Shared/
│   └── Components/
├── Stores/
├── ContentView.swift
└── SweetSpotApp.swift
```

### Models

The domain layer represents the different concepts required by the application, from places and events to participants, transportation, and geographic positions.

### Screens

Feature-specific interfaces are grouped into dedicated screens, keeping larger user flows separated from reusable UI components.

### Shared Components

Reusable SwiftUI elements are centralized to keep the UI consistent and avoid duplication.

### Stores

Application state and domain data are managed through dedicated stores, keeping state management outside individual views.

## Tech Stack

* **Swift**
* **SwiftUI**
* **Xcode**
* **State Management**
* **Location-oriented data modeling**
* **Component-based UI architecture**

## Getting Started

Clone the repository:

```bash
git clone https://github.com/morealcode/outdoor-project.git
```

Open the Xcode project:

```text
SweetSpot/SweetSpot.xcodeproj
```

Select an iOS Simulator or connected device and run the application with `⌘R`.

## What We Practiced

SweetSpot is a larger SwiftUI project that explores:

* Modeling a real-world product domain
* Structuring a growing iOS codebase
* SwiftUI screen composition
* Reusable component design
* Application state management
* Location-oriented application concepts
* Event and participant modeling
* User onboarding
* Navigation across multiple application flows
