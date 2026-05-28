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

    var body: some View {
        ZStack{
            Image ("CuttingBoard")
                .resizable()
                .scaledToFit()
            VStack {
                Text("PREP YOUR INGREDIENTS")
                Text ("Click when you want to drop the knife and cut the ingredient")
                
            }
            Image ("Knife")
                .resizable()
                .scaledToFit()
                .offset(x: moveRight ? 100 : -100)
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: 3.0)
                            .repeatForever(autoreverses: false)
                        value: moveRight
                    )  .onAppear {
                        moveRight.toggle()
                    }
                    
                    
                }
        }
    }
}

#Preview {
    PrepView()
}
