//
//  GridShape.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct Grid: Shape {
    let gridN : CGFloat
    let gridM : CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let n = rect.width / gridN
        let m = rect.height / gridM

        for i in stride(from: 0.0, through: rect.width, by: m) {
            path.move(to: CGPoint(x: CGFloat(i), y: 0))
            path.addLine(to: CGPoint(x: CGFloat(i), y: rect.height))
        }
        
        for i in stride(from: 0.0, through: rect.height, by: n) {
            path.move(to: CGPoint(x: 0, y: CGFloat(i)))
            path.addLine(to: CGPoint(x: rect.width, y: CGFloat(i)))
        }
        
        path.closeSubpath()
        
        return path
    }
    
}
