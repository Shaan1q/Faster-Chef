//
//  DataModel.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 4/29/26.
//

import SwiftUI
internal import Combine

struct Dish: Codable, Identifiable {

    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strMealThumb: String
    let strArea: String
    let strInstructions: String

    var id: String { idMeal }
}


struct DishResponse: Codable{
    var meals: [Dish]
}
