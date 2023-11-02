//
//  PiecesView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/18/23.
//

import SwiftUI

struct MainBoardView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    
    var body: some View {
        let len = pentomino.pentominoes.count
        
        ZStack(alignment: .topLeading) {
            PuzzleView(outline: pentomino.currPuzzle)
                .position(pentomino.PuzzlePosition())
            Grid(gridN: pentomino.boardSizeX, gridM: pentomino.boardSizeY)
                .stroke(.black, lineWidth: 2)
                .frame(width: pentomino.blockSize * pentomino.boardSizeX, height: pentomino.blockSize * pentomino.boardSizeY)
                .position(pentomino.BoardPosition())
                .padding()
            ForEach(0..<len, id: \.self) { i in
                PieceView(piece: $pentomino.pieces[i], index: i)
            }
        }
    }
}
