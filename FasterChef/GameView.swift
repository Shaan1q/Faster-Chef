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
                NavigationLink("Chapter 2: Super market Survivor") {
                    MarketView()
                }
                NavigationLink("Chapter 3:") {
                    PrepView()
                }
                NavigationLink("Chapter 4:") {
                    CookView()
                }
                NavigationLink("Chapter 5:") {
                    PlatingView()
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
