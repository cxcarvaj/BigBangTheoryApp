//
//  BigBangTheoryApp.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 1/4/25.
//

import SwiftUI

@MainActor let isiPad = UIDevice.current.userInterfaceIdiom == .pad

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
    }
}
