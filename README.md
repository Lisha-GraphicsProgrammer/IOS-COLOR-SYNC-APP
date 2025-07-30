# iOS Firebase Color Sync App

## Overview
SwiftUI app that generates random hex colors, displays them as cards, stores offline in `UserDefaults`, and syncs to Firebase Realtime Database when online. Network status is indicated (green/red).

## Setup
1. Clone repository.
2. Add Firebase SDK via Swift Package Manager or CocoaPods.
3. Download and add `GoogleService-Info.plist` to project.
4. Enable Realtime Database in Firebase console.
5. Replace bundle identifier and initialize Firebase.

## Usage
- Tap "Generate Color" to create hex and card.
- Indicator shows online/offline status.
- Offline colors persist using `UserDefaults`.
- Synced to Firebase automatically when internet returns.

