//
//  Plate.swift
//  
//
//  Created by Shaanzay Iqbal on 6/15/26.
//
import SwiftUI

struct Plate: View {
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
        Image("Plate 1")
            .resizable()
            .frame(width: 300, height: 300)
            .foregroundStyle(model.CircleColor)
            .offset(x: model.Clocation.x, y: model.Clocation.y)
            .overlay{
                if model.goalReachedC{
                    MovingScore(startingPosition: Constants.bPlate, amount: 10)
                }
                if model.loseText() {
                    MovingScoreSad(startingPosition: Constants.bPlate, amount: 10)
                }
            }
            .onLongPressGesture(minimumDuration: 1.0){
                withAnimation(.linear(duration: 0.5)){
                    model.Tapped(type: Shapess.plate, )
                    
                }
            }
            .gesture(
                DragGesture()
                    .onChanged{ dragLocation in
                        let CircleCentered = centerShape(position: dragLocation.location)
                        withAnimation(.linear(duration:0.5)){
                            model.dragLocation(type: .plate, location: CircleCentered)
                        }
                        
                    }
                    .onEnded{ dropLocation in
                        let centered = centerShape(position: dropLocation.location)
                        withAnimation(.linear(duration: 0.5)){
                            model.droppedShape(type: .plate, location: centered, )
                        }
                        
                    }
            )
            .disabled(model.goalReachedC)
    }
}
    
    #Preview {
        Plate()
            .environment(GameModel())
    }

