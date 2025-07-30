import SwiftUI
import Combine

class ColorStore: ObservableObject {
    @Published var items: [ColorItem] = []
    private let key = "color_items"
    private var cancellables = Set<AnyCancellable>()
    init() {
        load()
        // Sync when online and items pending
        NotificationCenter.default.publisher(for: .networkAvailable)
            .sink { _ in self.syncPending() }.store(in: &cancellables)
    }
    func addRandomColor() {
        let hex = String(format: "#%06X", Int.random(in: 0...0xFFFFFF))
        let item = ColorItem(id: UUID(), hex: hex, timestamp: Date())
        items.append(item)
        save()
        FirebaseManager.shared.upload(item)
    }
    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([ColorItem].self, from: data) {
            items = decoded
        }
    }
    private func syncPending() {
        items.forEach { FirebaseManager.shared.upload($0) }
    }
}
