import Firebase
import FirebaseDatabase

class FirebaseManager {
    static let shared = FirebaseManager()
    private var ref: DatabaseReference!

    func configureFirebase() {
        FirebaseApp.configure()
        ref = Database.database().reference().child("colors")
    }

    func upload(_ item: ColorItem) {
        guard let data = try? JSONEncoder().encode(item),
              let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
        ref.child(item.id.uuidString).setValue(dict) { err, _ in
            if let err = err {
                print("Upload error:", err.localizedDescription)
            }
        }
    }
}
