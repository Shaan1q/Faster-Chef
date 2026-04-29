//
//  Recommendations.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct RecommendationView: View {
    var body: some View {
        VStack {
            Text("Recommendations")
                .font(.largeTitle)
                .bold()
    
        }
        VStack(spacing: 20) {
            Button("Give me a recommendation!", systemImage: "star") {
           
            }
            .foregroundStyle(.black)
            .buttonStyle(.glass)
            
            Button("Reset", systemImage: "star") {
                
            }
            .foregroundStyle(.black)
            .buttonStyle(.glass)
        }
    }
}

#Preview {
    RecommendationView()
}
