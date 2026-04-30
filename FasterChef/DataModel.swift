//
//  DataModel.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 4/29/26.
//

import SwiftUI

struct Dish: Codable{
    let idMeal: Int
    let strMeal : String
    let strCategory: String
    let strMealThumb: String
}

struct DishDetails: Codable{
    let strArea : String
    let strInstructions: String
}
