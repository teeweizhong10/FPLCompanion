//
//  HomeViewModel.swift
//  FPL Companion
//
//  Created by Wei Zhong Tee on 12/26/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topPlayers: [Player]?
    var apiDataManager: FPLDataManager?

    init() {
        do {
            apiDataManager = try FPLDataManager()
            if let players = apiDataManager?.getTopPlayers() {
                topPlayers = players
            }
        } catch {
            print(error)
        }

    }
}
