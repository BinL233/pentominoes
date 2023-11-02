//
//  PuzzleButtonsView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct LeftPuzzleButtonsView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    var body: some View {
        let size = pentomino.puzzleButtonSize
        VStack {
            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 0)}}) {
                 Image("Board0button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)
            
            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 1)}}) {
                 Image("Board1button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)

            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 2)}}) {
                 Image("Board2button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)

            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 3)}}) {
                 Image("Board3button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)
        }
    }
}
