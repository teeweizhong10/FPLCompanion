//
//  HomeView.swift
//  FPL Companion
//
//  Created by Wei Zhong Tee on 12/26/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(content: {
                Text("Home")
                Text("Home")
                Text("Home")
            })
        }
        .navigationTitle(Text("Home View"))
    }
}

#Preview {
    HomeView()
}
