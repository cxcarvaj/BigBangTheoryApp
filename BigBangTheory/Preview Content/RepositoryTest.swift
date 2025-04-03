//
//  RepositoryTest.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI
import ComponentKit

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "BigBangTest", withExtension: "json")!
    }
    func loadJSONData() throws -> [BigBangTheoryModel] {
        try load(url: url, type: [BigBangTheoryModel].self, decoder: decoder)
    }
}


extension BigBangTheoryModel {
    static let test = BigBangTheoryModel(id: 3049,
                                   name: "The Deception Verification",
                                   season: 7,
                                   number: 2,
                                   summary: "Leonard's friendship with Sheldon is put to the test when he returns from the North Sea. Meanwhile, Wolowitz's relationship with his mother causes an unusual threat to his masculinity.\n",
                                   runtime: 30,
                                   airdate: Date(),
                                   image: "12101",
                                   url: URL(string: "https://www.tvmaze.com/episodes/3049/the-big-bang-theory-7x02-the-deception-verification")!)
}

extension ContentView {
    static var preview: some View {
        ContentView()
            .environment(BigBangTheoryVM(repository: RepositoryTest()))
    }
}
