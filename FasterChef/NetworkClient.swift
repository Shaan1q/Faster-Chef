import Foundation
import SwiftUI

@Observable
class NetworkClient {

    private(set) var searchResults: [Dish] = []

    private(set) var selectedDish: Dish?

    private(set) var randomDish: Dish?

    // SEARCH BY NAME

    func getDishFromName(name: String) async {

        searchResults = []

        let urlStr =
        "https://www.themealdb.com/api/json/v1/1/search.php?s=\(name)"

        guard let url = URL(string: urlStr) else { return }

        do {

            let (data, _) = try await URLSession.shared.data(from: url)

            let response =
            try JSONDecoder().decode(DishResponse.self, from: data)

            searchResults = response.meals

        } catch {

            print(error)
        }
    }

    // GET SINGLE DISH DETAILS

    func getDishDetails(id: Int) async {

        let url =
        URL(string:
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")

        guard let urlUnwrapped = url else { return }

        do {

            let (data, _) =
            try await URLSession.shared.data(from: urlUnwrapped)

            let response =
            try JSONDecoder().decode(DishResponse.self, from: data)

            selectedDish = response.meals.first

        } catch {

            print(error)
        }
    }

    // RANDOM DISH

    func getRandomDish() async {

        guard let url = URL(
            string: "https://www.themealdb.com/api/json/v1/1/random.php"
        ) else { return }

        do {

            let (data, _) =
            try await URLSession.shared.data(from: url)

            let response =
            try JSONDecoder().decode(DishResponse.self, from: data)

            randomDish = response.meals.first

        } catch {

            print(error)
        }
    }
}
