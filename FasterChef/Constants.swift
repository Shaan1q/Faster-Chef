//
//  Constants.swift
//  
//
//  Created by Shaanzay Iqbal on 6/15/26.
//

import Foundation
import SwiftUI
enum Shapess{
    case square
    case plate
    case wellington
}
struct Constants {
    static let redSquare = CGPoint(x: 100, y: 200)
    static let redCapsule = CGPoint(x: 0 , y: 250)
    static let redCircle = CGPoint(x: -100, y: 200)
    static let blackSquare = CGPoint(x: -100, y: -200)
    static let bWellington = CGPoint(x: 0 , y: 0)
    static let bPlate = CGPoint(x: 0, y: 0)
    static let scoreBoard = CGPoint(x:0, y: -360)
    static let shapeSize = CGFloat(50.0)
    static let capsuleLength = CGFloat(100.0)
    static let red = Color.red
    static let black = Color.black
    static let green = Color.green
    static let winText = "You Won"
    static let loseText = "You Lose"
}
extension View{
    func centerShape (position: CGPoint) -> CGPoint{
        let xCenter = position.x - Constants.shapeSize / 2
        let yCenter = position.y - Constants.shapeSize / 2
        return CGPoint(x: xCenter, y: yCenter)
    }
}
