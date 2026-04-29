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
                 SearchView()
                 }
            Tab ("Favorites", systemImage: "star"){
                FavoritesView()
            }
            Tab ("Recommendations", systemImage: "cloud.moon"){
                RecommendationView()
            }
        }
    
    }
}

#Preview {
    ContentView()
}
