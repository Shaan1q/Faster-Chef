//
//  PrepView.swift
//  FasterChef
//
//  Created by Student on 5/22/26.
//

import SwiftUI

struct PrepView: View {
    @State private var animate = false
    @State private var moveRight = false
    @State private var isVisible = false
    
    var body: some View {
        ZStack{
            Image ("CuttingBoard")
                .resizable()
                .scaledToFit()
            VStack {
                Text("PREP YOUR INGREDIENTS")
                    .font(.title)
                Text ("Click when you want to drop the knife and cut the ingredient")
                Text ("[TASK]")
                Spacer()
                
            }
            Image("Shallot")
                .resizable()
                .scaledToFit()
                        .opacity(isVisible ? 1 : 0) // Starts hidden
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.0)) {
                                isVisible = true // Triggers fade-in
                            }
                        }
            Image ("Knife")
                .resizable()
                .scaledToFit()
                .offset(x: moveRight ? 150 : -150, y: 150)
                .animation(
                    Animation.linear(duration: 1.0)
                        .repeatForever(autoreverses: true),
                    value: moveRight
                    )
    
                    .onAppear {
                        moveRight.toggle()
                    }
         
                    
                    
                    
                }
        }
    }


#Preview {
    PrepView()
}
