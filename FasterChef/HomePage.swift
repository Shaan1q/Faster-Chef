//
//  HomePage.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct HomePage: View {
    @State private var isAnimating = false
        var body: some View {
            VStack(spacing:10) {
                VStack() {
                    Text("WELCOME TO")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("FASTERCHEF")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("(but America)")
                        .font(.system(size: 30))
                }
                .foregroundColor(.white)
                .shadow(radius: 10)
                
                .scaleEffect(isAnimating ? 1.0 : 0.1)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .opacity(isAnimating ? 1 : 0)
            }
            .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 50, damping: 8).delay(0.2)) {
                            isAnimating = true
                        }
                    }
            .applyBrandBackground()
        }
}

#Preview {
    HomePage()
}
