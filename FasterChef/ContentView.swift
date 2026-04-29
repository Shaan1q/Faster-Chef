//
//  ContentView.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 4/29/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab ("Search", systemImage: "house"){
                 
                 }
            Tab ("Favorites", systemImage: "star"){
                
            }
            Tab ("Recommendations", systemImage: "cloud.moon"){
                
            }
        }
    
    }
}

#Preview {
    ContentView()
}
