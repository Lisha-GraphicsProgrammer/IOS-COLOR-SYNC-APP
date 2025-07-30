import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ColorStore
    @EnvironmentObject var network: NetworkMonitor

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Circle()
                        .fill(network.isOnline ? Color.green : Color.red)
                        .frame(width: 14, height: 14)
                    Text(network.isOnline ? "Online" : "Offline")
                        .font(.caption)
                    Spacer()
                    Button("Generate Color") { store.addRandomColor() }
                        .padding(.horizontal).padding(.vertical, 6)
                        .background(Color.blue).foregroundColor(.white).cornerRadius(8)
                }.padding()

                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(store.items.reversed()) { item in
                            ColorCard(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Color Generator")
        }
    }
}
