//
//  MovingScoreSad.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 6/15/26.
//

import SwiftUI
import Foundation

struct MovingScoreSad: View {
    let startingPosition: CGPoint
    let amount: Int
    @State private var offset: CGFloat = 0
    
    var body: some View {
        Text("-\(amount)")
            .font(.title3)
            .foregroundColor(.red)
            .shadow(color: .black, radius: 1.5, x: 1, y: 1)
            .offset(x: startingPosition.x, y: startingPosition.y + offset)
            .opacity(offset == 0 ? 1 : 0)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    offset = -100
                }
            }
    }
}

#Preview {
    MovingScoreSad(startingPosition: CGPoint(x: 0, y: 0), amount: 10)
}

