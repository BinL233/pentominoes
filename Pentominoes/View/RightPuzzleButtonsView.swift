//
//  RightPuzzleButtonsView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct RightPuzzleButtonsView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    var body: some View {
        let size = pentomino.puzzleButtonSize
        VStack {
            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 4)}}) {
                 Image("Board4button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)
            
            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 5)}}) {
                 Image("Board5button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)

            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 6)}}) {
                 Image("Board6button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)

            Button(action: {withAnimation{pentomino.ChangePuzzleButton(index: 7)}}) {
                 Image("Board7button")
                    .resizable()
                    .frame(width: size, height: size)
             }
            .frame(width: size, height: size)
            .padding(1)
        }
    }
    
}
