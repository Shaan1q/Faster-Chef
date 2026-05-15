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
            Tab ("Chefs' Picks", systemImage: "house"){
                RecommendationView()
                    .applyBrandBackground()
            }
            Tab ("Favorites", systemImage: "heart"){
                FavoritesView()
                    .applyBrandBackground()
            }
            Tab ("Search", systemImage: "magnifyingglass"){
                SearchView()
                   .applyBrandBackground()
            }
        }
    
    }
}

#Preview {
    ContentView()
        .environment(NetworkClient())
}
