//
//  BigBangTheoryModel.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import Foundation

struct BigBangTheoryModel: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let summary: String
    let runtime: Int
    let airdate: Date
    let image: String
    let url: URL
}

extension BigBangTheoryModel {
    var episodeInfo: String {
        "S\(season.formatted(.number.precision(.integerLength(2))))E\(number.formatted(.number.precision(.integerLength(2))))"
    }
    
    var airDateString: String {
        airdate.formatted(.dateTime.day(.twoDigits).month(.wide).year(.defaultDigits))
    }
}
