//
//  Team.swift
//  FootballChants
//
//  Created by Дмитрий Спичаков on 12.04.2023.
//

import Foundation

struct Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false 
}
