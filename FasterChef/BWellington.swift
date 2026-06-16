//
//  BWellington.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 6/16/26.
//

import SwiftUI

struct BWellington: View {
    var body: some View {
        Image("B-Plate")
            .resizable()
            .frame(width: 300,height: 300)
            .offset(x: Constants.bWellington.x, y: Constants.bWellington.y)
    }
}
    #Preview {
        Bplate()
    }

