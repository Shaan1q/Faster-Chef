//
//  Bplate.swift
//  
//
//  Created by Shaanzay Iqbal on 6/15/26.
//
import SwiftUI

struct Bplate: View {
    var body: some View {
        Image("B-Wellington")
            .resizable()
            .frame(width: 300,height: 300)
            .offset(x: Constants.bPlate.x, y: Constants.bPlate.y) 
    }
}
    #Preview {
        Bplate()
    }

