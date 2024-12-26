//
//  Structs.swift
//  fplAPItest
//
//  Created by Wei Zhong Tee on 11/13/24.
//

import Foundation

// Main Response Structure
struct BootstrapStaticResponse: Codable {
    let events: [Gameweek]
    let gameSettings: GameSettings
    let phases: [Phase]
    let teams: [Team]
    let totalPlayers: Int
    let elements: [Player]         // Players
    let elementStats: [ElementStat]
    let elementTypes: [ElementType] // Player positions

    enum CodingKeys: String, CodingKey {
        case events
        case gameSettings = "game_settings"
        case phases
        case teams
        case totalPlayers = "total_players"
        case elements
        case elementStats = "element_stats"
        case elementTypes = "element_types"
    }
}

// Gameweek Structure
struct Gameweek: Codable {
    let id: Int
    let name: String
    let deadline_time: String
    let average_entry_score: Int?
    let finished: Bool
    let data_checked: Bool
    let highest_scoring_entry: Int?
    let deadline_time_epoch: Int
    let deadline_time_game_offset: Int
    let highest_score: Int?
    let is_previous: Bool
    let is_current: Bool
    let is_next: Bool
    let chip_plays: [ChipPlay]
    let most_selected: Int?
    let most_transferred_in: Int?
    let top_element: Int?
    let top_element_info: TopElementInfo?
    let transfers_made: Int
    let most_captained: Int?
    let most_vice_captained: Int?
}

struct ChipPlay: Codable {
    let chip_name: String
    let num_played: Int
}

struct TopElementInfo: Codable {
    let id: Int
    let points: Int
}

// Team Structure
struct Team: Codable {
    let code: Int
    let draw: Int
    let form: String?
    let id: Int
    let loss: Int
    let name: String
    let played: Int
    let points: Int
    let position: Int
    let short_name: String
    let strength: Int
    let team_division: String?
    let unavailable: Bool
    let win: Int
    let strength_overall_home: Int
    let strength_overall_away: Int
    let strength_attack_home: Int
    let strength_attack_away: Int
    let strength_defence_home: Int
    let strength_defence_away: Int
    let pulse_id: Int
}

// Player Structure
struct Player: Codable {
    let chance_of_playing_next_round: Int?
    let chance_of_playing_this_round: Int?
    let code: Int
    let cost_change_event: Int
    let cost_change_event_fall: Int
    let cost_change_start: Int
    let cost_change_start_fall: Int
    let dreamteam_count: Int
    let element_type: Int
    let ep_next: String?
    let ep_this: String?
    let event_points: Int
    let first_name: String
    let form: String
    let id: Int
    let in_dreamteam: Bool
    let news: String
    let news_added: String?
    let now_cost: Int
    let photo: String
    let points_per_game: String
    let second_name: String
    let selected_by_percent: String
    let special: Bool
    let squad_number: Int?
    let status: String
    let team: Int
    let team_code: Int
    let total_points: Int
    let transfers_in: Int
    let transfers_in_event: Int
    let transfers_out: Int
    let transfers_out_event: Int
    let value_form: String
    let value_season: String
    let web_name: String
    let minutes: Int
    let goals_scored: Int
    let assists: Int
    let clean_sheets: Int
    let goals_conceded: Int
    let own_goals: Int
    let penalties_saved: Int
    let penalties_missed: Int
    let yellow_cards: Int
    let red_cards: Int
    let saves: Int
    let bonus: Int
    let bps: Int
    let influence: String
    let creativity: String
    let threat: String
    let ict_index: String
    let starts: Int
    let expected_goals: String
    let expected_assists: String
    let expected_goal_involvements: String
    let expected_goals_conceded: String
    let influence_rank: Int
    let influence_rank_type: Int
    let creativity_rank: Int
    let creativity_rank_type: Int
    let threat_rank: Int
    let threat_rank_type: Int
    let ict_index_rank: Int
    let ict_index_rank_type: Int
    let corners_and_indirect_freekicks_order: Int?
    let corners_and_indirect_freekicks_text: String?
    let direct_freekicks_order: Int?
    let direct_freekicks_text: String?
    let penalties_order: Int?
    let penalties_text: String?
}

// Element Type (Position) Structure
struct ElementType: Codable {
    let id: Int
    let plural_name: String
    let plural_name_short: String
    let singular_name: String
    let singular_name_short: String
    let squad_select: Int
    let squad_min_play: Int
    let squad_max_play: Int
    let element_count: Int
}

// Element Stat Structure
struct ElementStat: Codable {
    let label: String
    let name: String
}

// Game Settings Structure
struct GameSettings: Codable {
    let league_join_private_max: Int
    let league_join_public_max: Int
    let league_max_size_public_classic: Int
    let league_max_size_public_h2h: Int
    let league_max_size_private_h2h: Int
    let league_max_ko_rounds_private_h2h: Int
    let league_prefix_public: String
    let league_points_h2h_win: Int
    let league_points_h2h_lose: Int
    let league_points_h2h_draw: Int
    let squad_squadplay: Int
    let squad_squadsize: Int
    let squad_team_limit: Int
    let squad_total_spend: Int
    let ui_currency_multiplier: Int
    let ui_use_special_shirts: Bool
    let ui_special_shirt_exclusions: [String]? // Changed from [Any] to [String]
    let stats_form_days: Int
    let sys_vice_captain_enabled: Bool
    let transfers_cap: Int
    let transfers_sell_on_fee: Double
    let league_h2h_tiebreak_stats: [String]
    let timezone: String
}

// Phase Structure
struct Phase: Codable {
    let id: Int
    let name: String
    let start_event: Int
    let stop_event: Int
}
