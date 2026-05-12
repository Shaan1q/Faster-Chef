//
//  DataModel.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 4/29/26.
//

import SwiftUI
internal import Combine

struct Dish: Identifiable, Codable {
    let id = UUID()
    let idMeal : Int
    let strMeal : String
    let strCategory: String
    let strMealThumb: String
}

struct DishDetails: Codable{
    let strArea : String
    let strInstructions: String
}

struct favourites: Codable {
    var favourite: [Dish]
    var isFavourite: Bool

    init(favourite: [Dish] = [], isFavourite: Bool = false) {
        self.favourite = favourite
        self.isFavourite = isFavourite
    }
}

struct DishResponse: Codable{
    var meals: [Dish]
}
final class FavouritesStore: ObservableObject {
    @Published private(set) var favouriteIDs: Set<Int> = []
    
    init() {}
    
    func isFavourite(_ dish: Dish) -> Bool {
        favouriteIDs.contains(dish.idMeal)
    }

    func toggle(_ dish: Dish) {
        if favouriteIDs.contains(dish.idMeal) {
            favouriteIDs.remove(dish.idMeal)
        } else {
            favouriteIDs.insert(dish.idMeal)
        }
    }
}

