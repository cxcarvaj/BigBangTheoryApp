//
//  OrientationVM.swift
//  BigBangTheory
//
//  Created by Carlos Xavier Carvajal Villegas on 2/4/25.
//

import SwiftUI

@Observable @MainActor
final class OrientationVM {
    private(set) var isLandscape: Bool
    
    init() {
        self.isLandscape = UIDevice.current.orientation.isLandscape
        
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification,
                                               object: nil,
                                               queue: .main) { _ in
            Task { @MainActor in
                self.refresh()
            }
        }
    }
    
    private func refresh() {
        let isLandscape = UIDevice.current.orientation.isLandscape
        
        if self.isLandscape != isLandscape {
            self.isLandscape = isLandscape
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
}
