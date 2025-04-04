//
//  ContentView.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(BigBangTheoryVM.self) private var vm
    @Namespace private var namespace
    
    var body: some View {
        @Bindable var vm = vm
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(1..<13) { season in
                        SeasonsView(season: season, namespace: namespace)
                    }
                }
            }
            .safeAreaPadding()
//            .navigationDestination(for: BigBangTheoryModel.self) { episode in
//                EpisodesView(episode: episode, namespace: namespace)
//                    .closeButton {
//                        vm.selectedEpisode = nil
//                    }
//            }
//            .navigationTitle("The Big Bang Theory") //Con navigationTitle no podemos usar custom fonts
            #if os(iOS)
            .bigBangTheoryToolbar
            #endif
        }
        .sheet(item: $vm.selectedEpisode) { episode in
            EpisodesView(episode: episode, namespace: namespace)
            #if os(iOS)
                .closeButton {
                    vm.selectedEpisode = nil
                }
            #endif
        }
    }
}

#Preview {
    ContentView.preview
        .environment(OrientationVM())
}
