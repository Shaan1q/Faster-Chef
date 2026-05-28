//
//  GameStart.swift
//  FasterChef
//
//  Created by Student on 5/22/26.
//

import SwiftUI

struct GameStart: View {

    @State private var changed = [false, false, false]

    @State private var positions: [CGFloat] = [-220, 0, 220]

    @State private var shuffleCount = 0

    var body: some View {

        ZStack {
            Image("boxBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ZStack {

                ForEach(0..<3) { index in

                    Image(changed[index] ? "openBox" : "box")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .offset(y: positions[index])

                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                changed[index].toggle()
                            }
                        }
                }
            }
        }
        .onAppear {
            shuffleBoxes()
        }
    }

    func shuffleBoxes() {

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in

            withAnimation(.easeInOut(duration: 0.8)) {

                let first = Int.random(in: 0...2)
                var second = Int.random(in: 0...2)

                while second == first {
                    second = Int.random(in: 0...2)
                }

                positions.swapAt(first, second)
            }

            shuffleCount += 1

            if shuffleCount >= 3 {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    GameStart()
}
