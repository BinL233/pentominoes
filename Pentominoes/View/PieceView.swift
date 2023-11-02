//
//  PieceView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    @Binding var piece : Piece
    @State private var offset = CGSize.zero
    @State private var isDragging: Bool = false
    
    var index : Int
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                self.isDragging = true
                self.offset = value.translation
            }
            .onEnded { value in
                withAnimation {
                    self.isDragging = false
                    let offset = pentomino.offset(for: piece, from: offset)
                    self.piece.position = piece.position + offset
                    self.offset = CGSize.zero
                }
            }
        
        let tapGesture = TapGesture()
            .onEnded { value in
                withAnimation {
                    piece.position.orientation.incrementZ()
                    //print(piece.position.orientation.Z, piece.position.orientation.X, piece.position.orientation.Y)
                }
            }
        
        let longPressGesture = LongPressGesture(minimumDuration: 0.5)
            .onEnded { value in
                withAnimation {
                    piece.position.orientation.incrementXorY()
                    //print(piece.position.orientation.Z, piece.position.orientation.X, piece.position.orientation.Y)
                }
            }
        
        PentominoView(isDragging: $isDragging, outline: piece.outline)
            .opacity(pentomino.Check(piece: piece) ? 0.5 : 1)
            .rotation3DEffect(Angle(degrees: Double(piece.position.orientation.X * 180)), axis: (x: 1, y: 0, z: 0))
            .rotation3DEffect(Angle(degrees: Double(piece.position.orientation.Y * 180)), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(Angle(degrees: Double(piece.position.orientation.Z * 90)), axis: (x: 0, y: 0, z: 1))
            .position(pentomino.positionFor(piece, index: index, Z: piece.position.orientation.Z))
            .shadow(color: .gray, radius: isDragging ? 5 : 0, x: 0, y: isDragging ? 5 : 0)
            .offset(offset)
            .gesture(dragGesture)
            .gesture(tapGesture)
            .gesture(longPressGesture)
    }
}
