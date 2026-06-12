//
//  GameView.swift
//  FasterChef
//
//  Created by Student on 5/22/26.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing:25) {
                NavigationLink("Chapter 1: The Final Round") {
                    GameStart()
                }
                NavigationLink("Chapter 2: Prep") {
                    PrepView()
                }
                NavigationLink("Chapter 3: Cook") {
                    CookView()
                }
                NavigationLink("Chapter 4: Plate") {
                    PlatingView()
                }
                NavigationLink("Chapter 5: The Final Results") {
                    GameEnd()
                }
            }
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.black)
            
        }
    }
}

#Preview {
    GameView()
}
