//
//  Puzzle.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct Puzzle: Shape {
    let outlines : PuzzleOutline
    let points: [[Point]]
    let size : Size
    
    init(outlines: PuzzleOutline) {
        self.outlines = outlines
        self.points = outlines.outlines
        self.size = outlines.size
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let n = rect.width / CGFloat(size.width)
        let m = rect.height / CGFloat(size.height)
        
        for p in points {
            if let initPoint = p.first {
                path.move(to: CGPoint(x: initPoint.x * Int(n), y: initPoint.y * Int(m)))
            }
            
            for point in p.dropFirst() {
                path.addLine(to: CGPoint(x: point.x * Int(n), y: point.y * Int(m)))
            }
        }
        
        return path
    }
}
