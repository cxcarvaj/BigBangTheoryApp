//
//  BigBangTheoryVM.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI

@Observable
final class BigBangTheoryVM {
    let repository: DataRepository
    
    var episodes: [BigBangTheoryModel] = []
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.episodes = try repository.loadJSONData()
        } catch {
            self.episodes = []
            print(error)
        }
    }
    
    func getEpisodesBySeason(_ season: Int) -> [BigBangTheoryModel] {
        episodes.filter{ $0.season == season}
    }
}
