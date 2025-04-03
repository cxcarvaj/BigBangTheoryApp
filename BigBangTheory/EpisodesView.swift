//
//  EpisodesView.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 2/4/25.
//

import SwiftUI

struct EpisodesView: View {
    @Environment(OrientationVM.self) private var orientationVM
    let episode: BigBangTheoryModel
    let namespace: Namespace.ID
    
    var body: some View {
        ScrollView {
            VStack {
                Image(episode.image)
                    .resizable()
                    .aspectRatio(contentMode: isiPad && orientationVM.isLandscape ? .fill : .fit)
                    .navigationTransition(.zoom(sourceID: "cover-\(episode.id)", in: namespace))
                    .frame(maxHeight: isiPad && orientationVM.isLandscape ? 350 : .infinity)
                    .clipped()
                    .overlay(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text(episode.name)
                                .font(.bbtTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(2)
                                .navigationTransition(.zoom(sourceID: "title-\(episode.id)", in: namespace))
//                                .matchedGeometryEffect(id: "title-\(episode.id)", in: namespace)
                            
                            Text(episode.episodeInfo)
                                .font(.bbtBody)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .navigationTransition(.zoom(sourceID: "info-\(episode.id)", in: namespace))
//                                .matchedGeometryEffect(id: "info-\(episode.id)", in: namespace)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            SemiRoundedRectangle(radius: 10)
                                .fill(Color.black.opacity(0.3))
                        }
                        .foregroundStyle(.background)
                    }

                
                VStack(alignment: .leading) {
                    Text(episode.summary)
                    
                    HStack {
                        Text(episode.airDateString)
                        Spacer()
                        Text("\(episode.runtime) min")
                    }
                    HStack {
                        Spacer()
                        Link(destination: episode.url) {
                            VStack {
                                Image(.tvmazeIcon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 75)
                                
                                Text("More info")
                                    .font(.bbtSubheadline)
                            }
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.bbtBody)
                .safeAreaPadding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    @Previewable @Namespace var namespace
    EpisodesView(episode: .test, namespace: namespace)
}
