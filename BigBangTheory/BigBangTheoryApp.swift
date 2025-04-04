//
//  BigBangTheoryApp.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI
import SwiftData

#if os(iOS)
@MainActor let isiPad = UIDevice.current.userInterfaceIdiom == .pad
#elseif os(macOS) || os(tvOS) || os(visionOS)
@MainActor let isiPad = true
#endif

@main
struct BigBangTheoryApp: App {
    @State private var vm = BigBangTheoryVM()
    @State private var orientation = OrientationVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(vm)
                .environment(orientation)
        }
        // Las unicas tablas que debo poner aquí, son las tablas padres, es decir que no dependan de otras.
        .modelContainer(for: BBTModel.self)
    }
}
