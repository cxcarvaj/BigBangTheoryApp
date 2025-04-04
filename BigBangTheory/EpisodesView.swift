//
//  EpisodesView.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 2/4/25.
//

import SwiftUI
import SwiftData

struct EpisodesView: View {
    @Environment(\.modelContext) private var context
    @Environment(OrientationVM.self) private var orientationVM
    let episode: BigBangTheoryModel
    let namespace: Namespace.ID
    
    @Query private var metaDataEpisodes: [BBTModel]
    @State private var editedNotes = ""
    
    init(episode: BigBangTheoryModel, namespace: Namespace.ID) {
        self.episode = episode
        self.namespace = namespace
        _metaDataEpisodes = Query(filter:
                                    #Predicate {$0.id == episode.id})
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(episode.image)
                    .resizable()
                    .aspectRatio(contentMode: isiPad && orientationVM.isLandscape ? .fill : .fit)
                #if os(iOS) || os(tvOS) || os(visionOS)
                    .navigationTransition(.zoom(sourceID: "cover-\(episode.id)", in: namespace))
                #endif
                    .frame(maxHeight: isiPad && orientationVM.isLandscape ? 350 : .infinity)
                    .clipped()
                    .overlay(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text(episode.name)
                                .font(.bbtTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(2)
                            #if os(iOS) || os(tvOS) || os(visionOS)
                                .navigationTransition(.zoom(sourceID: "title-\(episode.id)", in: namespace))
                            #endif
//                                .matchedGeometryEffect(id: "title-\(episode.id)", in: namespace)
                            
                            Text(episode.episodeInfo)
                                .font(.bbtBody)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            #if os(iOS) || os(tvOS) || os(visionOS)
                                .navigationTransition(.zoom(sourceID: "info-\(episode.id)", in: namespace))
                            #endif
//                                .matchedGeometryEffect(id: "info-\(episode.id)", in: namespace)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            SemiRoundedRectangle(radius: 10)
                                .fill(Color.black.opacity(0.3))
                        }
                        .foregroundStyle(.white)
                    }

                
                VStack(alignment: .leading) {
                    Text(episode.summary)
                    
                    HStack {
                        Text(episode.airDateString)
                        Spacer()
                        Text("\(episode.runtime) min")
                    }
                    HStack {
                        if let meta = metaDataEpisodes.first {
                            VStack(alignment: .leading) {
                                Button {
                                    meta.watched.toggle()
                                } label: {
                                    HStack(alignment: .firstTextBaseline) {
                                        Image(systemName: "eye")
                                            .symbolVariant(meta.watched ? .fill : .fill.slash)
                                        Text(meta.watched ? "Watched" : "Not watched")
                                    }
                                }
                                .tint(meta.watched ? .green : .gray)
                                
                                Button {
                                    meta.favorited.toggle()
                                } label: {
                                    HStack(alignment: .firstTextBaseline) {
                                        Image(systemName: "star")
                                            .symbolVariant(meta.favorited ? .fill : .fill.slash)
                                        Text(meta.favorited ? "Favorited" : "Not favorited")
                                    }
                                }
                                .tint(meta.favorited ? .green : .gray)

                            }
                            .buttonStyle(.borderedProminent)
                            .contentTransition(.symbolEffect(.replace))
                        }
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
                    
                    Text("Notes:")
                        .padding(.top, 10)
                    TextField("Insert notes for the episode",
                              text: $editedNotes,
                              axis: .vertical)
                        .font(.bbtSubheadline)
                        .lineLimit(3, reservesSpace: true)
                        .padding(10)
                        .background {
                            Color.gray.opacity(0.2)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Button {
                            if let episode = metaDataEpisodes.first {
                                episode.notes = editedNotes
                            }
                        } label: {
                            Text("Update note")
                        }
                        .font(.bbtSubheadline)
                        .buttonStyle(.borderedProminent)
                        
                        if let episode = metaDataEpisodes.first {
                            if episode.notes != editedNotes {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.green)
                                    .symbolVariant(.circle.fill)

                            } else {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.red)
                                    .symbolVariant(.circle.fill)
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
        .onAppear {
            if metaDataEpisodes.count == 0 {
                let newModel = BBTModel(id: episode.id,
                                        favorited: false,
                                        watched: false,
                                        notes: "")
                context.insert(newModel)
            }
            if let episode = metaDataEpisodes.first {
                editedNotes = episode.notes ?? ""
            }
        }
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Namespace var namespace
    EpisodesView(episode: .test, namespace: namespace)
        .environment(OrientationVM())
}
