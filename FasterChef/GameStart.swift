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
    
    @State private var introStep = 0
    
    @State private var introImage = "Intro"

    let introMessages = [
        "Welcome to Faster Chef where your dreams come true!",
        "We are finally at the last round of the challenge.",
        "The winner is going to walk away with the a grand prize of $250,000",
        ", the MasterChef trophy, and the official title of MasterChef.",
        "Our 4 chef judges Laurie, Kayla, Myrna, and Shanzay shall pick the winner tonight!",
        "Now finally...lets welcome our two contestants: Spongebob and user!!!",
        "I'm ready! I'm ready! I'm ready!",
        "I'm here to beat spongebob for that 25 grand!!!",
        "Ok then lets get straight into the boxes!!!"
    ]

    var body: some View {

        ZStack {
            Image("boxBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            if showIntro {
                ZStack {
                    Image(introImage)
                        .resizable()
                        .scaledToFit()

                    VStack {
                        Spacer()

                        Text(introMessages[introStep])
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.bottom, 200)
                    }

                    VStack {
                        Spacer()

                        HStack {
                            Spacer()

                            Button("Start") {
                                withAnimation {
                                    showIntro = false
                                }
                                shuffleBoxes()
                            }
                            .font(.headline)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.trailing, 30)
                            .padding(.bottom, 30)
                        }
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if introStep < introMessages.count - 1 {
                        withAnimation {
                            introStep += 1
                        }
                        if introStep + 2 == introMessages.count - 1 {
                            introImage = "spongebob"
                        } else if introStep + 1 == introMessages.count - 1 {
                            introImage = "user"
                        } else if introStep == introMessages.count - 1 {
                            introImage = "Intro"
                        }
                    }
                }
            }
            else {

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
