import SwiftUI
@main
struct ColorSyncAppApp: App {
    @StateObject var store = ColorStore()
    @StateObject var network = NetworkMonitor()
    init() {
        FirebaseManager.shared.configureFirebase()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(network)
        }
    }
}
