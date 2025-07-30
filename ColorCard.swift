import SwiftUI

struct ColorCard: View {
    let item: ColorItem
    var body: some View {
        VStack {
            Text(item.hex).font(.headline).padding(8)
            Rectangle()
                .fill(Color(hex: item.hex))
                .frame(height: 100)
                .cornerRadius(8)
            Text(item.timestamp, style: .time).font(.caption2)
        }
        .padding()
        .background(Color(white: 0.95)).cornerRadius(10).shadow(radius: 1)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF)/255
        let g = Double((int >> 8) & 0xFF)/255
        let b = Double(int & 0xFF)/255
        self.init(red: r, green: g, blue: b)
    }
}
