//
//  SampleView.swift
//  FasterChef
//
//  Created by Student on 4/30/26.
//
import SwiftUI

struct SampleView: View {
    @State private var isAnimating = false
    var body: some View {
        NavigationStack {
            VStack(spacing:10) {
                VStack() {
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
            }
            .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 50, damping: 8).delay(0.2)) {
                            isAnimating = true
                        }
                    }
            Spacer()
                .frame(height: 32)
            VStack {
                NavigationLink(destination: {
                    DestinationView1(displayText: "SCREEN 1", fontColor: .red)
                }, label: {
                    Text("Introduction")
                })
                Spacer()
                    .frame(height: 32)
                NavigationLink(destination: {
                    DestinationView2()
                }, label: {
                    Label("Skip", systemImage: "bolt.fill")
                })
            }
        }
    }
}

struct DestinationView1: View {
    let displayText: String
    let fontColor: Color
    var body: some View {
        VStack {
            Text(displayText)
                .foregroundStyle(fontColor)
                .font(.system(size: 24))
        }
    }
}

struct DestinationView2: View {
    var body: some View {
        VStack {
            Text("Swift UI is amazing")
        }
    }
}

#Preview {
    SampleView()
}
