import Network
import Foundation

extension Notification.Name {
    static let networkAvailable = Notification.Name("networkAvailable")
}

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    @Published var isOnline = false
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                let old = self.isOnline
                self.isOnline = path.status == .satisfied
                if self.isOnline && !old {
                    NotificationCenter.default.post(name: .networkAvailable, object: nil)
                }
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}
