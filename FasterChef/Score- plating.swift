//
//  Score- plating.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 6/15/26.
//

import SwiftUI

struct Score: View {
    @Environment(GameModel.self)private var model: GameModel
    var body: some View {
        Text("Score:\(model.score)")
            .font(.largeTitle)
            .offset(x: Constants.scoreBoard.x,y: Constants.scoreBoard.y )
            .transaction{transaction in transaction.animation = nil}
        
    }
}
    
    #Preview {
        Score()
            .environment(GameModel())
    }
