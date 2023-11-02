//
//  Position.swift
//  Pentominoes
//
//  Created by Hannan, John Joseph on 9/5/23.
//

import Foundation



// identifies placement of a single pentomino on a board, including x/y coordinate   Uses unit coordinates on a 14 x 14 board

struct Position : Decodable, Equatable {
    var x : Int = 0
    var y : Int = 0
    var orientation : Rotation
}

struct Rotation : Decodable, Equatable {
    var X : Int = 0
    var Y : Int = 0
    var Z : Int = 0
    
    mutating func incrementZ() {
        Z = Z + 1
    }
    
    mutating func incrementXorY() {
        if Z % 4 == 0 || Z % 4 == 2 {
            Y = Y + 1
        } else {
            X = X + 1
        }
    }
}

struct Offset {
    let x : Int
    let y : Int
    
    static func +(lhs: Position, rhs: Offset) -> Position {
        Position(x: lhs.x + rhs.y, y: lhs.y + rhs.x, orientation: lhs.orientation)
        }
}

