//
//  Repository.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import Foundation
import ComponentKit

protocol DataRepository: JSONLoader, Sendable {
    func loadJSONData() throws -> [BigBangTheoryModel]
}

extension DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    }
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd"
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }

}

struct Repository: DataRepository {
    func loadJSONData() throws -> [BigBangTheoryModel] {
        try load(url: url, type: [BigBangTheoryModel].self, decoder: decoder)
    }
}
