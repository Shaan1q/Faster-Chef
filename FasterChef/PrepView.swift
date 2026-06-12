//
//  PrepView.swift
//  FasterChef
//
//  Created by Student on 5/22/26.
//

import SwiftUI

struct PrepView: View {
    @State private var knifeX: CGFloat = -150
    @State private var knifeY: CGFloat = 190
    @State private var movingRight = true
    @State private var timer: Timer?
    @State private var shallotX: CGFloat = 0
    @State private var showShallot = true
    @State private var showDicedShallot = false
    @State private var points = 0
    @State private var currentIngredient = 0
    let ingredients = [
        ("Shallot", "DicedShallot"),
        ("Onion", "DicedOnions"),
        ("Mushrooms", "DicedMushrooms")
        
    ]
    @State private var isDiced = false
    
    var body: some View {
<<<<<<< HEAD
        ZStack{
            Image ("TableBg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Image ("CuttingBoard")
                .resizable()
                .scaledToFit()
                .padding(.top, 100)
            VStack {
                Text("PREP YOUR INGREDIENTS")
                    .font(.title)
                    .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 380, height: 50)
                        )
                    .bold()
                    .fontDesign(.rounded)
                    .padding (.top, 90)
                    .padding (.bottom, 1)
               
                Text ("Click when you want to stop the knife and cut the ingredient")
                    .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 388, height: 50)
                        )
                    .padding (.bottom, 1)
                    .font(.title3)
                    .fontDesign(.rounded)
                
                    .padding()
                    Text("Current Task: Dice \(ingredients[currentIngredient].0)")
                        .font(.title2)
                        .fontWeight(.bold)
                Text ("Score: \(points)" )
                    .padding (.top, 1)
                    .font(.title2)
                    .fontDesign(.rounded)
                Spacer()
                    .fontDesign(.rounded)
                
            }
            Image(isDiced
                  ? ingredients[currentIngredient].1
                  : ingredients[currentIngredient].0)
                .resizable()
                .scaledToFit()
                .offset(x: 10, y: 20)
            
            Image ("Knife")
                .resizable()
                .scaledToFit()
                .offset(x: knifeX, y: knifeY)
        }
        .contentShape(Rectangle())
        .onTapGesture{
            stopKnife()
        }
        .onAppear {
            startKnifeMovement()
        }
        
       
=======
        Text("Prep")
>>>>>>> main
    }

    func startKnifeMovement() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            if movingRight {
                knifeX += 2
                
                if knifeX >= 150 {
                    movingRight = false
                }
            } else {
                knifeX -= 2
                
                if knifeX <= -150 {
                    movingRight = true
                }
            }
        }
    }
    
    func stopKnife() {
        let distance = abs(knifeX - shallotX)

        if distance < 100 {
            timer?.invalidate()
            points += 5

            withAnimation(.easeIn(duration: 0.3)) {
                knifeY += 100
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isDiced = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if currentIngredient < ingredients.count - 1 {
                        currentIngredient += 1
                        isDiced = false
                        knifeX = -150
                        knifeY = 150
                        movingRight = true
                        startKnifeMovement()
                    }
                }
            }

        }
    }
    
         
                    
                    
        
    }


#Preview {
    PrepView()
}
