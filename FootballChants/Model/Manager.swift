//
//  Manager.swift
//  FootballChants
//
//  Created by Дмитрий Спичаков on 12.04.2023.
//

import Foundation

enum JobType: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: JobType
}
