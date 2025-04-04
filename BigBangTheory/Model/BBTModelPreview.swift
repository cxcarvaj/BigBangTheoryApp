//
//  BBTModelPreview.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 3/4/25.
//

import SwiftUI
import SwiftData

struct SampleData: PreviewModifier {
    static func makeSharedContext() throws -> ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BBTModel.self, configurations: configuration)
        
        let episode = BBTModel(id: 3049, favorited: false, watched: true, notes: "This episode was good")
        container.mainContext.insert(episode)
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }

}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
