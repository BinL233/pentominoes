//
//  PentominoesApp.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

@main
struct PentominoesApp: App {
    let pentomino = PentominoesManager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(pentomino)
        }
    }
}
