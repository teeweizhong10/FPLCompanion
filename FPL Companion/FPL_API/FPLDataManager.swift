//
//  main.swift
//  fplAPItest
//
//  Created by Wei Zhong Tee on 11/13/24.
//

import Foundation

class FPLDataManager {
    let response: BootstrapStaticResponse
    

    enum FPLError: Error, LocalizedError {
        case playerNotFound
        case networkError
        case invalidData
        case timeout

        var errorDescription: String? {
           switch self {
           case .playerNotFound:
               return "Player not found."
           case .networkError:
               return "Network error occurred."
           case .invalidData:
               return "Received invalid data."
           case .timeout:
               return "Request timed out."
           }
        }
    }

    init() throws {
        let semaphore = DispatchSemaphore(value: 0)
        var loadedResponse: BootstrapStaticResponse?
        var loadError: Error?

        Task {
            do {
                let url = URL(string: "https://fantasy.premierleague.com/api/bootstrap-static/")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoded = try JSONDecoder().decode(BootstrapStaticResponse.self, from: data)
                loadedResponse = decoded
            } catch {
                loadError = FPLError.networkError
            }
            semaphore.signal()
        }

        let timeoutResult = semaphore.wait(timeout: .now() + 2)
        if timeoutResult == .timedOut {
            throw FPLError.timeout
        }

        if let error = loadError {
            throw error
        }

        guard let response = loadedResponse else {
            throw FPLError.invalidData
        }

        self.response = response
    }

    func getTopPlayers() -> [Player] {
        return Array(response.elements.sorted { $0.total_points > $1.total_points }.prefix(25))
    }

    func getPlayerStats(forPlayer playerName: String) async throws -> Player? {
        // Search for player (case insensitive)
        let players = response.elements.filter { player in
            let fullName = "\(player.first_name) \(player.second_name)".lowercased()
            let webName = player.web_name.lowercased()
            let searchName = playerName.lowercased()

            return fullName.contains(searchName) || webName.contains(searchName)
        }

        if players.isEmpty {
            print("No players found matching '\(playerName)'")
            return nil
        }

        // If multiple players found, show all matches
//        for player in players {
//            let team = response.teams.first { $0.id == player.team }
//
//            print("\n=== \(player.first_name) \(player.second_name) ===")
//            print("Team: \(team?.name ?? "Unknown")")
//            print("Total Points: \(player.total_points)")
//            print("Points Per Game: \(player.points_per_game)")
//            print("Current Form: \(player.form)")
//            print("Goals: \(player.goals_scored)")
//            print("Assists: \(player.assists)")
//            print("PhotoID: \(player.photo)")
//            print("Selected by: \(player.selected_by_percent)%")
//        }

        return players.first
    }

     func allPlayers() -> [Player] {
        response.elements
    }
}
