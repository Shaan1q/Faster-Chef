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

    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strMealThumb: String
    let strArea: String
    let strInstructions: String


}


struct DishResponse: Codable{
    var meals: [Dish]
}
