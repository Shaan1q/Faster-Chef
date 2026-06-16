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
    @State private var gameModel = GameModel()

    @StateObject private var favoritesManager = FavoritesManager()

    var body: some Scene {

        WindowGroup {

            HomePage()
                .environment(networkClient)
                .environment(gameModel)
                .environmentObject(favoritesManager)
        }
    }
}
