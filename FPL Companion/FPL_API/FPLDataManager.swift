//
//  main.swift
//  fplAPItest
//
//  Created by Wei Zhong Tee on 11/13/24.
//

import Foundation

class FPLDataManager {
    let response: BootstrapStaticResponse

    enum FPLError: Error {
        case playerNotFound
        case networkError
        case invalidData
    }

    init() async throws {
        do {
            let url = URL(string: "https://fantasy.premierleague.com/api/bootstrap-static/")!

            let (data, _) = try await URLSession.shared.data(from: url)
            response = try JSONDecoder().decode(BootstrapStaticResponse.self, from: data)
        } catch {
            throw FPLError.networkError
        }
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
}
