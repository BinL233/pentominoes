//
//  PentominoesManager.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import Foundation

class PentominoesManager : ObservableObject {
    @Published var puzzles : [PuzzleOutline]
    @Published var pentominoes : [PentominoOutline]
    @Published var pieces : [Piece]
    @Published var boardSizeX : CGFloat
    @Published var boardSizeY : CGFloat
    @Published var blockSize : CGFloat
    @Published var currPuzzle : PuzzleOutline
    @Published var puzzleOpacity : CGFloat
    @Published var puzzleButtonSize : CGFloat
    let isSolve : Bool
    let solution : [String: [String: PentominoSolution]]
    let boardOffset : CGFloat
    let puzzleOffset : CGFloat
    let pieceOffset : [[CGFloat]]
    let x : Int
    let y : Int
    
    init() {
        let localPuzzles = PuzzleOutline.puzzles ?? []
        let localBlockSize : CGFloat = 40
        currPuzzle = localPuzzles[0]
        puzzles = []
        pentominoes = []
        pieces = []
        x = 4 // number of columns
        y = 3 // number of rows
        blockSize = localBlockSize
        boardSizeX = 14
        boardSizeY = 14
        puzzleOffset = 19
        boardOffset = 4
        puzzleOpacity = 0.6
        puzzleButtonSize = 90
        isSolve = false
        pieceOffset = [[localBlockSize/2, localBlockSize/2], [0, localBlockSize/2], [localBlockSize/2, localBlockSize/2],
                       [localBlockSize/2, localBlockSize/2], [localBlockSize/2, localBlockSize/2], [localBlockSize/2, 0],
                       [localBlockSize/2, localBlockSize/2], [localBlockSize/2, localBlockSize/2], [0, 0],
                       [0, 0], [0, 0], [localBlockSize/2, localBlockSize/2]]

        let puzzleSolution = PuzzleSolution.puzzleSolution?.solutions ?? [:]

        puzzles = PuzzleOutline.puzzles ?? []
        pentominoes = PentominoOutline.pentominoes ?? []
        solution = puzzleSolution
        initPieces()
    }
    
    private func initPieces() {
        pieces.removeAll()
        for i in 0..<y {
            for j in 0..<x {
                var piece = Piece(outline: pentominoes[i*x+j])
                piece.position = Position(x: j*5 + 5, y: i*5 + 19, orientation: Rotation())
                pieces.append(piece)
            }
        }
    }
    
    private func ChangePuzzle(index: Int) {
        initPieces()
        switch index{
        case 0:
            puzzleOpacity = 0
        case 1:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[0]
        case 2:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[1]
        case 3:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[2]
        case 4:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[3]
        case 5:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[4]
        case 6:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[5]
        case 7:
            puzzleOpacity = 0.6
            currPuzzle = puzzles[6]
        default:
            currPuzzle = puzzles[0]
        }
    }
    
    func ChangePuzzleButton(index: Int) {
        ChangePuzzle(index: index)
    }
    
    func ResetButton() {
        initPieces()
    }
    
    func PuzzlePosition() -> CGPoint {
        let point = CGPoint(x: blockSize * 12.5 + puzzleOffset, y: blockSize * 7.5 + puzzleOffset)
        return point
    }
    
    func BoardPosition() -> CGPoint {
        let point = CGPoint(x: blockSize * 12.5 + boardOffset, y: blockSize * 7.5 + boardOffset)
        return point
    }
    
    func positionFor(_ piece:Piece, index: Int, Z: Int) -> CGPoint {
        var x = CGFloat(piece.position.x) * CGFloat(blockSize) + pieceOffset[index][0]// + 5 * CGFloat(blockSize)
        var y = CGFloat(piece.position.y) * CGFloat(blockSize) + pieceOffset[index][1]// + 19 * CGFloat(blockSize)
        
        if pieceOffset[index][0] != pieceOffset[index][1] {
            if Z%4 == 1 || Z%4 == 3 {
                x = CGFloat(piece.position.x) * CGFloat(blockSize) + pieceOffset[index][1]// + 5 * CGFloat(blockSize)
                y = CGFloat(piece.position.y) * CGFloat(blockSize) + pieceOffset[index][0]// + 19 * CGFloat(blockSize)
            }
        }
        
        let point = CGPoint(x: x, y: y)
        return point
    }
    
    func Check(piece: Piece) -> Bool {
        let penName = piece.outline.name
        let puzzleName = currPuzzle.name
        let ans : PentominoSolution = (solution[puzzleName]?[penName])!
        
        return RotationCheck(piece: piece, ans: ans) && PositionCheck(piece: piece, ans: ans)
    }
    
    func PositionCheck(piece: Piece, ans: PentominoSolution) -> Bool {
        let pieceOffsetX : Int = piece.outline.size.width / 2
        let pieceOffsetY : Int = piece.outline.size.height / 2
        let pieceAngle = (piece.position.orientation.X * 180 + piece.position.orientation.Y * 180 + piece.position.orientation.Z * 90) % 360
        var piecePositionX = piece.position.x - 6 - pieceOffsetX
        var piecePositionY = piece.position.y - 1 - pieceOffsetY
        if pieceAngle != 0 && pieceAngle != 180 {
            piecePositionX = piece.position.x - 6 - pieceOffsetY
            piecePositionY = piece.position.y - 1 - pieceOffsetX
        }
        if piecePositionX == ans.x && piecePositionY == ans.y {
            return true
        }
        
        return false
    }
    
    func RotationCheck(piece: Piece, ans: PentominoSolution) -> Bool {
        let isMirror = ans.orientation.Rotation()[1]
        let pieceAngle = (piece.position.orientation.X * 180 + piece.position.orientation.Y * 180 + piece.position.orientation.Z * 90) % 360
        let ansAngle = ans.orientation.Rotation()[0]
        
        if (piece.position.orientation.X + piece.position.orientation.Y) % 2 != 0 {
            if isMirror == 1 && pieceAngle == ansAngle {
                return true
            }
        } else {
            if isMirror == 0 && pieceAngle == ansAngle {
                return true
            }
        }
        
        return false
    }
    
    private func PieceSolve() {
        initPieces()
        let test = 6
        for i in 0..<pieces.count {
            let pieceOffsetX : Int = pieces[i].outline.size.width / 2
            let pieceOffsetY : Int = pieces[i].outline.size.height / 2
            let ans : PentominoSolution = (solution[currPuzzle.name]?[pieces[i].outline.name])!
            let angle = ans.orientation.Rotation()[0]
            let mirror = ans.orientation.Rotation()[1]
            
            if mirror == 1 {
                pieces[i].position.orientation.Y = 1
                pieces[i].position.orientation.Z = (angle + 180) / 90
            } else {
                pieces[i].position.orientation.Z = (angle) / 90
            }
            
            if angle != 0 && angle != 180 {
                pieces[i].position.x = ans.x + 6 + pieceOffsetY
                pieces[i].position.y = ans.y + 1 + pieceOffsetX
            } else {
                pieces[i].position.x = ans.x + 6 + pieceOffsetX
                pieces[i].position.y = ans.y + 1 + pieceOffsetY
            }
            print(pieces[test].outline.name, pieces[test].position.x - 6 - pieces[test].outline.size.width / 2, pieces[test].position.y - 1 - pieces[test].outline.size.height / 2, pieces[test].position.orientation)
            print(pieces[test].outline.size.width / 2, pieces[test].outline.size.height / 2)
        }
    }
    
    func PieceSolveButton() {
        PieceSolve()
    }
    
    func offset( for size:CGSize) -> Offset {
        Offset(x: Int(round(size.height/CGFloat(blockSize))),
             y: Int(round(size.width/CGFloat(blockSize))))
    }
    
    func offset(for piece: Piece, from size: CGSize) -> Offset {
        let offset = offset(for: size)
        return offset
    }
}
