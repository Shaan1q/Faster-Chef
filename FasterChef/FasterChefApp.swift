//
//  FasterChefApp.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 4/29/26.
//

import SwiftUI

@main
struct FasterChefApp: App {

    @State private var networkClient = NetworkClient()

    @StateObject private var favoritesManager = FavoritesManager()

    var body: some Scene {

        WindowGroup {

            HomePage()
                .environment(networkClient)
                .environmentObject(favoritesManager)
        }
    }
}
