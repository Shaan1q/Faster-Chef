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

//struct DestinationView1: View {
//    let displayText: String
//    let fontColor: Color
//    
//    @State private var isAnimating = false
//
//    var body: some View {
//        ZStack {
//            Image("door")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//
//            Image("P1")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .scaleEffect(isAnimating ? 3.0 : 0.1) 
//                .opacity(isAnimating ? 1 : 0)
//        }
//        .onAppear {
//            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
//                isAnimating = true
//            }
//        }
//    }
//}

struct DestinationView1: View {
    let displayText: String
    let fontColor: Color
    let participants = ["P1", "P2", "P3", "P4"]

    @State private var currentIndex = 0
    @State private var isVisible = false
    @State private var offsetX: CGFloat = 0

    var body: some View {
        ZStack {
            Image("door")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Image(participants[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(isVisible ? 1.0 : 0.1)
                    .opacity(isVisible ? 1 : 0)
                    .offset(x: offsetX)

                Text("Participant \(currentIndex + 1)")
                    .font(.title)
                    .foregroundColor(.white)
                    .opacity(isVisible ? 1 : 0)
            }
        }
        .onAppear {
            runAnimation()
        }
    }

    func runAnimation() {
        offsetX = 0
        isVisible = false

        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
            isVisible = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeIn(duration: 0.5)) {
                offsetX = UIScreen.main.bounds.width
                isVisible = false
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            currentIndex = (currentIndex + 1) % participants.count
            runAnimation()
        }
    }
}

struct DestinationView2: View {
    var body: some View {
        VStack {
            Text("Page One")
        }
    }
}

#Preview {
    SampleView()
}
