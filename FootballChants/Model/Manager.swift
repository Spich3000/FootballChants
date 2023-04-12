//
//  Manager.swift
//  FootballChants
//
//  Created by Дмитрий Спичаков on 12.04.2023.
//

import Foundation

enum JobType {
    case manager
    case headCoach
}

struct Manager {
    let name: String
    let job: JobType
}
