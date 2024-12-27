//
//  HomeView.swift
//  FPL Companion
//
//  Created by Wei Zhong Tee on 12/26/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView(content: {
                if let players = viewModel.topPlayers {
                    ForEach(players, id: \.first_name) { player in
                        HStack {
                            Text(player.web_name)
                                .font(.headline)
                            Text("\(player.total_points) points")
                        }

                    }
                } else {
                    ProgressView("Loading...")
                        .padding()
                }
            })
            .navigationTitle(Text("FPL Companion"))
        }
    }
}

#Preview {
    HomeView()
}
