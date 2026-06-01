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

    @State private var boxChosen = false
    
    @State private var selectedBox: Int? = nil
    
    @State private var showIntro = true

    var body: some View {

        ZStack {
            Image("boxBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            if showIntro {
                Image("Intro")
                    .resizable()
                    .scaledToFit()
            } else {

                if boxChosen {
                    Text("You Got Beef Wellington!!!")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        .offset(y: -200)
                }

                ZStack {
                    ForEach(0..<3) { index in
                        if selectedBox == nil || selectedBox == index {
                            Image(changed[index] ? "openBox" : "box")
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: selectedBox == index ? 450 : 300,
                                    height: selectedBox == index ? 450 : 300
                                )
                                .offset(
                                    y: selectedBox == index
                                    ? 100
                                    : positions[index]
                                )
                                .animation(.easeInOut(duration: 1.0), value: selectedBox)
                                .onTapGesture {
                                    if !boxChosen {
                                        boxChosen = true
                                        selectedBox = index

                                        withAnimation(.easeInOut) {
                                            changed[index].toggle()
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1000) {
                withAnimation {
                    showIntro = false
                }
                shuffleBoxes()
            }
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
