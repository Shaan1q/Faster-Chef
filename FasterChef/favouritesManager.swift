//
//  Favourite manager.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 5/19/26.
//
import SwiftUI
internal import Combine

final class FavoritesManager: ObservableObject {

    @AppStorage("favoriteDishes")
    private var favoriteDishesData: Data = Data()

    @Published var favoriteDishes: [Dish] = [] {
        didSet {
            saveFavorites()
        }
    }

    init() {
        loadFavorites()
    }

    // MARK: - Favorite Logic

    func isFavorite(_ dish: Dish) -> Bool {

        favoriteDishes.contains {
            $0.idMeal == dish.idMeal
        }
    }

    func toggle(_ dish: Dish) {

        if isFavorite(dish) {

            favoriteDishes.removeAll {
                $0.idMeal == dish.idMeal
            }

        } else {

            favoriteDishes.append(dish)
        }
    }

    // MARK: - Persistence

    private func saveFavorites() {

        do {

            let encoded =
            try JSONEncoder().encode(favoriteDishes)

            favoriteDishesData = encoded

        } catch {

            print("Failed to save favorites:", error)
        }
    }

    private func loadFavorites() {

        do {

            favoriteDishes =
            try JSONDecoder().decode(
                [Dish].self,
                from: favoriteDishesData
            )

        } catch {

            print("Failed to load favorites:", error)
        }
    }
}
