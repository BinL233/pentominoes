//
//  PentominoView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct PentominoView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    @Binding var isDragging: Bool
    var outline : PentominoOutline
    var body: some View {
        ZStack {
            let Pen = Pentomino(outline: outline)
            let width = pentomino.blockSize * CGFloat(outline.size.width)
            let height = pentomino.blockSize * CGFloat(outline.size.height)
            Pen
                .fill(Color(piece: Piece(outline: outline)), style: FillStyle(eoFill: true))
                .frame(width: isDragging ? width * 1.2 : width, height: isDragging ? height * 1.2 : height)
            Grid(gridN: CGFloat(outline.size.width), gridM: CGFloat(outline.size.height))
                .stroke(lineWidth: 2)
                .frame(width: isDragging ? width * 1.2 : width, height: isDragging ? height * 1.2 : height)
                .clipShape(Pen)
            Pen
                .stroke(lineWidth: 2)
                .frame(width: isDragging ? width * 1.2 : width, height: isDragging ? height * 1.2 : height)
        }
        
    }
}
