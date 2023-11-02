//
//  ContentView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.init(red: 0.85, green: 0.9, blue: 1).ignoresSafeArea()
            VStack {
                HStack {
                    LeftPuzzleButtonsView()
                    Spacer()
                    RightPuzzleButtonsView()
                }
                .padding(.horizontal, 60)
                .padding(20)
                FunctionalButtonsView()
                
            }
            .padding()
            MainBoardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pentomino = PentominoesManager()
        RootView()
            .environmentObject(pentomino)
    }
}
