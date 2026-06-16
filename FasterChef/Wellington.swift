//
//  Wellington.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 6/15/26.
//
import SwiftUI

struct Wellingotn: View {
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
        Image("Wellington")
            .resizable()
            .frame(width: 300, height: 300)
            .foregroundStyle(model.CircleColor)
            .offset(x: model.CapsuleLocation.x, y: model.CapsuleLocation.y)
            .overlay{
                if model.goalReachedCap{
                    MovingScore(startingPosition: Constants.bWellington, amount: 10)
                }
                if model.loseText() {
                    MovingScoreSad(startingPosition: Constants.bWellington, amount: 10)
                }
            }
            .onLongPressGesture(minimumDuration: 1.0){
                withAnimation(.linear(duration: 0.5)){
                    model.Tapped(type: Shapess.wellington, )
                    
                }
            }
            .gesture(
                DragGesture()
                    .onChanged{ dragLocation in
                        let CircleCentered = centerShape(position: dragLocation.location)
                        withAnimation(.linear(duration:0.5)){
                            model.dragLocation(type: .wellington, location: CircleCentered)
                        }
                        
                    }
                    .onEnded{ dropLocation in
                        let centered = centerShape(position: dropLocation.location)
                        withAnimation(.linear(duration: 0.5)){
                            model.droppedShape(type: .wellington, location: centered )
                        }
                        
                    }
            )
            .disabled(model.goalReachedCap)
    }
}
    
    #Preview {
        Wellingotn()
            .environment(GameModel())
    }

