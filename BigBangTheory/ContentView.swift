//
//  ContentView.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var vm = BigBangTheoryVM()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(1..<13) { season in
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(vm.getEpisodesBySeason(season)) { episode in
                                    EpisodeCard(episode: episode)
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
                                .frame(height: 50)
                        }
                    }
                }
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    ContentView.preview()
}
