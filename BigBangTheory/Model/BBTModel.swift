//
//  BigBangTheoryModel.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 3/4/25.
//

import Foundation
import SwiftData

@Model
final class BBTModel {
    @Attribute(.unique) var id: Int
    var favorited: Bool
    var watched: Bool
    var notes: String?
    
    init(id: Int, favorited: Bool, watched: Bool, notes: String?) {
        self.id = id
        self.favorited = favorited
        self.watched = watched
        self.notes = notes
    }
    
}
