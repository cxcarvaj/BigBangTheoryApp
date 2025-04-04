//
//  CloseButton.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 2/4/25.
//

import SwiftUI

fileprivate struct CloseButton: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .topTrailing) {
                Button {
                    action()
                } label: {
                    Image(systemName: "xmark")
                        .symbolVariant(.circle.fill)
                }
                .buttonBorderShape(.circle)
                #if os(iOS) || os(visionOS)
                .hoverEffect(.highlight)
                #endif
                .font(.title)
                .foregroundStyle(.white.opacity(0.8))
                .padding(.trailing)
            }
    }
}

extension View {
    func closeButton(action: @escaping () -> Void) -> some View {
        modifier(CloseButton(action: action))
    }
}
