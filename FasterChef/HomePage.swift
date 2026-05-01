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
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                VStack {
                    Text("WELCOME TO")
                        .font(.system(size: 40))
                        .fontWeight(.bold)

                    Text("FASTERCHEF")
                        .font(.system(size: 40))
                        .fontWeight(.bold)

                    Text("(but BTech)")
                        .font(.system(size: 30))

                    Image("F")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .shadow(radius: 10)
                }
                .foregroundColor(.white)
                .shadow(radius: 10)
                .scaleEffect(isAnimating ? 1.0 : 0.1)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .opacity(isAnimating ? 1 : 0)

                VStack(spacing: 20) {
                    NavigationLink("Introduction") {
                        DestinationView1(displayText: "SCREEN 1", fontColor: .red)
                    }

                    NavigationLink {
                        DestinationView2()
                    } label: {
                        Label("Skip", systemImage: "bolt.fill")
                    }
                }

                Spacer()
            }
            .onAppear {
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 8).delay(0.2)) {
                    isAnimating = true
                }
            }
            .applyBrandBackground()
        }
    }
}

#Preview {
    HomePage()
}
