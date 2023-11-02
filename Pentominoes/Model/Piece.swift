//
//  Piece.swift
//  Pentominoes
//
//  Created by Hannan, John Joseph on 9/5/23.
//

import Foundation
import SwiftUI



//Each piece is fully determined by its outline and its position

struct Piece : Identifiable {
    let outline : PentominoOutline
    var position : Position = Position(orientation: Rotation())
    var id : String { outline.name }
    
}

extension Color {
    init(piece: Piece) {
        let id = piece.id
        
        switch id {
        case "X":
            self = .red
        case "P":
            self = .blue
        case "F":
            self = .brown
        case "W":
            self = .yellow
        case "Z":
            self = .cyan
        case "U":
            self = .green
        case "V":
            self = .indigo
        case "T":
            self = .mint
        case "L":
            self = .orange
        case "Y":
            self = .pink
        case "N":
            self = .teal
        case "I":
            self = .purple
        default:
            self = .white
        }
    }
}
