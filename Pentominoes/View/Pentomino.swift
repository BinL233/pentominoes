//
//  Pentomino.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct Pentomino: Shape {
    let outline : PentominoOutline
    let points: [Point]
    let size : Size
    
    init(outline: PentominoOutline) {
        self.outline = outline
        self.points = outline.outline
        self.size = outline.size
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let n = rect.width / CGFloat(size.width)
        let m = rect.height / CGFloat(size.height)
        
        if let initPoint = points.first {
            path.move(to: CGPoint(x: CGFloat(initPoint.x) * n, y: CGFloat(initPoint.y) * m))
        }
        
        for point in points.dropFirst() {
            path.addLine(to: CGPoint(x: CGFloat(point.x) * n, y: CGFloat(point.y) * m))
        }

        return path
    }
}
