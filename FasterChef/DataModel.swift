//
//  DataModel.swift
//  FasterChef
//
//  Created by Shaanzay Iqbal on 4/29/26.
//

import SwiftUI

struct Dish: Identifiable, Codable {
    let id: Int
    let strMeal : String
    let strCategory: String
    let strMealThumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strCategory
        case strMealThumb
    }
}

struct DishDetails: Codable{
    let strArea : String
    let strInstructions: String
}

struct DishResponse: Codable{
    var meals: [Dish]
}
