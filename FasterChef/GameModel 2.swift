//
//  GameModel 2.swift
//  
//
//  Created by Shaanzay Iqbal on 6/15/26.
//


import Foundation
import SwiftUI

@Observable
class GameModel {
    private(set) var SAngleRotation = 0.0
    private(set) var CAngleRotation = 0.0
    private(set) var SquareColor = Constants.red
    private(set) var Slocation = Constants.redSquare
    private(set) var CapsuleLocation: CGPoint = Constants.redCapsule
    private(set) var capsuleColor = Constants.red
    private(set) var CircleColor = Constants.red
    private(set) var Clocation = Constants.redCircle
    private(set) var longTapped: Bool = false
    private(set) var squareRCount = 0
    private(set) var score = 0
    private(set) var goalReachedS = false
    private(set) var goalReachedC = false
    private(set) var goalReachedCap = false



    func squareDoubleTapped(){
        SAngleRotation += 45.0
        squareRCount += 1
    }
    func CapsuleDoubleTapped(){
        CAngleRotation += 45.0
        squareRCount += 1
    }
    func Tapped(type:Shapess){
        if type == .square {
            SquareColor = (SquareColor == Constants.red ? Constants.green: Constants.red)
            longTapped = true
        }else if type == .plate{
            CircleColor = (CircleColor == Constants.red ? Constants.green: Constants.red)
            longTapped = true
        } else if type == .wellington{
            capsuleColor = (capsuleColor == Constants.red ? Constants.green: Constants.red)
            longTapped = true
            
        }
    }
    func dragLocation(type: Shapess, location: CGPoint){
        if type == .square{
            Slocation = location
            SquareColor = .blue
        } else if type == .plate{
            Clocation = location
            CircleColor = .blue
        } else {
            CapsuleLocation = location
            capsuleColor = .blue
        }
    }
    func dropLocation (type: Shapess){
        if type == .square{
            
            Slocation = Constants.redSquare
            if longTapped == true{
                SquareColor = .green
            }else{
                SquareColor = .red
            }
        }else if type == .plate{
            Clocation = Constants.redCircle
            if longTapped == true{
                CircleColor = .green
            }else{
                CircleColor = .red
            }        }
        else {
            CapsuleLocation = Constants.redCapsule
            if longTapped == true{
                capsuleColor = .green
            }else{
                capsuleColor = .red
            }
        }
    }
    func droppedShape (type:Shapess, location: CGPoint){
        if type == .square{
            if gameWin(type: .square, dropLocation: location){
                Slocation = Constants.blackSquare
                SquareColor = .indigo
                score += 10
                goalReachedS = true
            } else{
                Slocation = Constants.redSquare
                SquareColor = .red
                score -= 10
                goalReachedS = false
            }
        }
        if type == .plate{
            if gameWin(type: .plate, dropLocation: location){
                Clocation = Constants.bPlate
                CircleColor = .indigo
                score += 10
                goalReachedC = true
            } else{
                CircleColor = if longTapped{.green} else {.red}
                Clocation = Constants.redCircle
                score -= 10
                goalReachedC = false
            }
        }
        if type == .wellington{
            if gameWin(type: .wellington, dropLocation: location){
                CapsuleLocation = Constants.bWellington
                capsuleColor = .indigo
                score += 10
                goalReachedCap = true
            } else{
                capsuleColor = if longTapped{.green} else {.red}
                CapsuleLocation = Constants.redCapsule
                score -= 10
                goalReachedCap = false
            }
        }
        
    }
    func gameWin(type: Shapess, dropLocation:CGPoint)-> Bool{
        if type == .plate {
            let xFromTarget = abs(dropLocation.x - Constants.bPlate.x)
            let yFromTarget = abs(dropLocation.y - Constants.bPlate.y)
            if xFromTarget <= 5 && yFromTarget <= 20 {
                return true
            } else{
                return false
            }
        }
        if type == .square{
            let xCFromTarget = abs(dropLocation.x - Constants.blackSquare.x)
            let yCFromTarget = abs(dropLocation.y - Constants.blackSquare.y)
            if xCFromTarget <= 5 && yCFromTarget <= 20 && squareRCount % 2 == 1 {
                return true
            } else{
                return false
            }
        }
        if type == .wellington {
            let xFromTarget = abs(dropLocation.x - Constants.bWellington.x)
            let yFromTarget = abs(dropLocation.y - Constants.bWellington.y)
            if xFromTarget <= 5 && yFromTarget <= 20 {
                return true
            } else{
                return false
            }
        }
        return false
    }
    func winText ()-> Bool{
        return goalReachedC && goalReachedS && goalReachedCap
    }
    func loseText ()-> Bool{
        return score < 0
    }
    func gameOver ()-> Bool{
        return winText() || loseText()
    }
    func resetEverything (){
        Slocation = Constants.redSquare
        SquareColor = .red
        CapsuleLocation = Constants.redCapsule
        CircleColor = .red
        Clocation = Constants.redCircle
        capsuleColor = .red
        score = 0
        goalReachedC = false
        goalReachedS = false
        goalReachedCap = false
        squareRCount = 0
    }
}

