//
//  BigBangTheoryToolbar.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 2/4/25.
//

import SwiftUI

fileprivate struct BigBangTheoryToolbar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
            ToolbarItem(placement: .principal) {
                Text("The Big Bang Theory")
                    .font(.bbtLargeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading )
            }
        }
        .toolbarTitleDisplayMode(.inline)
    }
}

extension View {
    var bigBangTheoryToolbar: some View {
        modifier(BigBangTheoryToolbar())
    }
}
