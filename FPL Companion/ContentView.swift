//
//  ContentView.swift
//  FPL Companion
//
//  Created by Wei Zhong Tee on 12/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var defaultTabViewItem = TabViewItem.home

    private enum TabViewItem: Int {
        case favorites = 0
        case teams = 1
        case home = 2
        case players = 3
        case settings = 4
    }

    var body: some View {
        TabView(selection: $defaultTabViewItem) {
            Tab("Favorites", systemImage: "star.fill", value: TabViewItem.favorites) {
                Text("Favorites View")
            }

            Tab("Home", systemImage: "house.fill", value: TabViewItem.home) {
                HomeView()
            }

            Tab("Players", systemImage: "person.fill", value: TabViewItem.players) {
                Text("Players View")
            }
        }
    }
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        //.modelContainer(for: .self, inMemory: true)
}
