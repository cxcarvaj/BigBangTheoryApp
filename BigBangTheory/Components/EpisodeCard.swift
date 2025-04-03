//
//  EpisodeCard.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI

struct EpisodeCard: View {
    let episode: BigBangTheoryModel
    let namespace: Namespace.ID
    
    var body: some View {
        Image(episode.image)
            .resizable()
            .scaledToFill()
            .frame(width: isiPad ? 350 : 250,
                   height: isiPad ? 200 : 150)
//            .matchedGeometryEffect(id: "cover-\(episode.id)", in: namespace)
            .matchedTransitionSource(id: "cover-\(episode.id)", in: namespace)
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(episode.name)
                        .font(.bbtBody)
                        .matchedTransitionSource(id: "title-\(episode.id)", in: namespace)
                    
                    Text(episode.episodeInfo)
                        .font(.bbtSubheadline)
                        .matchedTransitionSource(id: "info-\(episode.id)", in: namespace)
                }
                .multilineTextAlignment(.leading)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background {
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                }
                .foregroundStyle(.background)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .primary.opacity(0.4), radius: 10, x: 0, y: 5)
//            .padding([.vertical, .horizontal], 10)
            .padding(.bottom)
    }
}

#Preview {
    @Previewable @Namespace var namespace
    EpisodeCard(episode: .test, namespace: namespace)
}
