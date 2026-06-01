//
//  PrepView.swift
//  FasterChef
//
//  Created by Student on 5/22/26.
//

import SwiftUI

struct PrepView: View {
    @State private var knifeX: CGFloat = -150
    @State private var knifeY: CGFloat = 150
    @State private var movingRight = true
    @State private var timer: Timer?
    @State private var shallotX: CGFloat = 0
    @State private var showShallot = true

       let shallotX: CGFloat = 0
    
    var body: some View {
        ZStack{
            Image ("CuttingBoard")
                .resizable()
                .scaledToFit()
            VStack {
                Text("PREP YOUR INGREDIENTS")
                    .font(.title)
                    .bold()
                    .fontDesign(.rounded)
                    .padding (.top, 15)
                    .padding (.bottom, 15)
                Text ("Click when you want to drop the knife and cut the ingredient")
                    .padding (.bottom, 15)
                    .fontDesign(.rounded)
                Text ("Task: Cut Shallots")
                Text ("Points: ")
                    .padding (.top, 15)
                    .fontDesign(.rounded)
                Spacer()
                    .fontDesign(.rounded)
                
            }
            Image("Shallot")
                .resizable()
                .scaledToFit()
            if showShallot {
                Image("DicedShallot")
                    .resizable()
                    .scaledToFit()
                    .offset(x: shallotX)
            }
            
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
    func stopKnife(){
    let distance = abs(knifeX - shallotX)
        if distance < 100 {
            timer?.invalidate()
            withAnimation(.easeIn(duration: 0.3)){
                knifeY += 100
                    }
                } else {
                    print("Missed!")
                }
    }
    
    //add code to replace shallot with diced shallots
         
                    
                    
        
    }


#Preview {
    PrepView()
}
