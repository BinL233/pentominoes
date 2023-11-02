//
//  PuzzleView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/18/23.
//

import SwiftUI

struct PuzzleView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    var outline : PuzzleOutline
    var body: some View {
        Puzzle(outlines: outline)
            .fill(.gray.opacity(pentomino.puzzleOpacity), style: FillStyle(eoFill: true))
            .frame(width: pentomino.blockSize * CGFloat(outline.size.width), height: pentomino.blockSize * CGFloat(outline.size.height))
    }
}
