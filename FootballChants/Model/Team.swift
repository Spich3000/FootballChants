//
//  Team.swift
//  FootballChants
//
//  Created by Дмитрий Спичаков on 12.04.2023.
//

import Foundation

class Team {
    
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool
        
    init(
        id: TeamType,
        name: String,
        info: String,
        manager: Manager,
        founded: String,
        isPlaying: Bool = false
    ) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaying = isPlaying
    }
}
