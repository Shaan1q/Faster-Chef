//
//  NetworkClient.swift
//  Chew_Task020
//
//  Created by Student on 3/26/26.
//

import Foundation
import SwiftUI

@Observable
class NetworkClient{
    private(set) var searchResults : [Dish] = []
    private(set) var selectedDishDetails : DishDetails = DishDetails(strArea: "China", strInstructions: "Boil")
    
    func getDishFromName(name: String) async {
        searchResults = []
        let urlStr = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(name)"
        
        guard let url = URL(string: urlStr) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(DishResponse.self, from: data)
            for dish in response.meals {
                if !searchResults.contains(where: { $0.id == dish.id }) {
                    searchResults.append(dish)
                }
            }
        } catch let error {
            print(error)
        }
        
    }
    
    func getDishDetails(id: Int) async {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")
        
        guard let urlUnwrapped = url else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: urlUnwrapped)
            let dishDetails = try JSONDecoder().decode(DishDetails.self, from: data)
            selectedDishDetails = dishDetails
        } catch let error{
            print(error)
        }
    }
}
