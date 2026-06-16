//
//  PlatingView.swift
//  FasterChef
//
//  Created by Student on 5/22/26.
//

import SwiftUI

struct PlatingView: View {
    var body: some View {
        ZStack{
            Image("tablee")
                .resizable()
                .frame(width: 600, height: 1000)
            Score()
            BWellington()
            Plate()
            Bplate()
            Wellingotn()
           
        }
    }
}


#Preview {
    PlatingView()
        .environment(GameModel())
}
