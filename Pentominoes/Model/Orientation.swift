//
//  Orientation.swift
//  Pentominoes
//
//  Created by Hannan, John Joseph on 9/14/23.
//

import Foundation


// This Orientation type is identical to UIImage.Orientation.  We define it to avoid needing UIKit in the model.  See documentation for this type to see what each value means in terms of rotations and flips.  

enum Orientation : String, Codable {
    case up, left, down, right
    case upMirrored, leftMirrored, downMirrored, rightMirrored
}

extension Orientation {
    func Rotation() -> [Int] {
        switch self {
        case .up:
            return [0, 0]
        case .left:
            return [270, 0]
        case .down:
            return [180, 0]
        case .right:
            return [90, 0]
        case .upMirrored:
            return [180, 1]
        case .leftMirrored:
            return [90, 1]
        case .downMirrored:
            return [0, 1]
        case .rightMirrored:
            return [270, 1]
        }
    }
}
