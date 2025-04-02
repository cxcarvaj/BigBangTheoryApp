//
//  EpisodeCard.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI

struct EpisodeCard: View {
    let episode: BigBangTheoryModel
    
    var body: some View {
        Image(episode.image)
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 150)
            .overlay(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(episode.name)
                        .font(.bbtBody)
                    
                    Text(episode.episodeInfo)
                        .font(.bbtSubheadline)
                }
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
    EpisodeCard(episode: .test)
}
