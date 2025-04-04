//
//  SeasonsView.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 2/4/25.
//

import SwiftUI

struct SeasonsView: View {
    @Environment(BigBangTheoryVM.self) private var vm
    
    let season: Int
    let namespace: Namespace.ID

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(vm.getEpisodesBySeason(season)) { episode in
//                        NavigationLink(value: episode) {
//                            EpisodeCard(episode: episode, namespace: namespace)
//                        }
                        #if os(iOS) || os(visionOS)
                        Button {
                            vm.selectedEpisode = episode
                        } label: {
                            EpisodeCard(episode: episode, namespace: namespace)
                                .hoverEffect(.lift)
                        }
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                        .buttonStyle(.plain)
                        #elseif os(macOS)
                        NavigationLink(value: episode) {
                            EpisodeCard(episode: episode, namespace: namespace)
                        }
                        .buttonStyle(.plain)
                        #elseif os(tvOS)
                        NavigationLink(value: episode) {
                            EpisodeCard(episode: episode, namespace: namespace)
                        }
                        .buttonStyle(.card) //Este estilo solamente existe en AppleTV
                        #endif
                    }
                }
                #if os(tvOS)
                .frame(height: 250)
                #endif
            }
        } header: {
            HStack {
                Text("Season \(season)")
                    .font(.bbtTitle)
                Spacer()
                Image("season\(season)")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(height: isiPad ? 100 : 50)
            }
            .padding(.top)
        }
    }
}

#Preview(traits: .fixedLayout(width: 390, height: 200)) {
    @Previewable @Namespace var namespace
    SeasonsView(season: 1, namespace: namespace)
        .environment(BigBangTheoryVM(repository: RepositoryTest()))
}
