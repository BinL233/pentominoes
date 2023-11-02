//
//  Solution.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/21/23.
//

import Foundation

struct PuzzleSolution : Codable {
    let solutions: [String: [String: PentominoSolution]]
    
    static let puzzleSolution : PuzzleSolution? = {
        return solutionData()
    }()
}

struct PentominoSolution : Codable {
    var x: Int = 0
    var y: Int = 0
    var orientation: Orientation
}

extension PuzzleSolution {
    static func solutionData() -> PuzzleSolution? {
        guard let url = Bundle.main.url(forResource: "Solutions", withExtension: "json") else { return nil }
        let data : PuzzleSolution?
        
        do {
            let contents = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            data = try decoder.decode(PuzzleSolution.self, from: contents)
        } catch {
            print(error)
            data = nil
        }
        return data
    }
}
