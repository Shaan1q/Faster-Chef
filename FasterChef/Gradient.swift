//
//  Gradient.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct BrandGradient: View {
    let color1 = Color(red: 0xf8/255, green: 0xc1/255, blue: 0x1c/255)
    let color2 = Color(red: 0xde/255, green: 0x6e/255, blue: 0x0c/255)
    let color3 = Color(red: 0xbc/255, green: 0x3a/255, blue: 0x17/255)

    var body: some View {
        LinearGradient(colors: [color1, color2, color3], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct BrandBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            BrandGradient()
            content
        }
    }
}

extension View {
    func applyBrandBackground() -> some View {
        self.modifier(BrandBackground())
    }
}

