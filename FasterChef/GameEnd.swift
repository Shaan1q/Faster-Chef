//
//  GameEnd.swift
//  FasterChef
//
//  Created by Student on 6/11/26.
//

import SwiftUI

struct GameEnd: View {
    @State private var rotationDegrees: Double = 0.0
    
    var body: some View {
        ZStack {
            Image("WinPageNP")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image("personWin")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(rotationDegrees))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        rotationDegrees += 360
                    }
                }
        }
    }
}

#Preview {
    GameEnd()
}
