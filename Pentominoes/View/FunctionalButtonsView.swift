//
//  FunctionalButtonsView.swift
//  Pentominoes
//
//  Created by Kaile Ying on 9/17/23.
//

import SwiftUI

struct FunctionalButtonsView: View {
    @EnvironmentObject var pentomino : PentominoesManager
    var body: some View {
        HStack {
            Button(action: {withAnimation{pentomino.ResetButton()}}) {
                Text("Reset")
                    .foregroundColor(.red)
                    .font(.title)
            }
            Spacer()
            Button(action: {withAnimation{pentomino.PieceSolveButton()}}) {
                Text("Solve")
                    .foregroundColor(.blue)
                    .font(.title)
            }
        }
        .padding(.horizontal, 80)
    }
}

struct FunctionalButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalButtonsView()
    }
}
