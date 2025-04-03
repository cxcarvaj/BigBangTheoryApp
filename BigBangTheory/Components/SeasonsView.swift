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
                        Button {
                            vm.selectedEpisode = episode
                        } label: {
                            EpisodeCard(episode: episode, namespace: namespace)
                                .hoverEffect(.lift)
                        }
                    }
                }
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
