//
//  Recommendations.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct RecommendationView: View {
    @State private var meal: Meal?
    var body: some View {
        VStack{
            Text ("Recommendations")
                .font(.title)
                .bold()
        }
            VStack(spacing: 20) {
                if let meal = meal {
                    Text(meal.mealName)
                        .font(.title)
                        .bold()

                    AsyncImage(url: URL(string: meal.mealImage)) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    ScrollView {
                        Text(meal.strInstructions)
                            .padding()
                        }
                }

                Button("🍽️ Give me a recommendation! 🍽️") {
                    fetchMeal()
                }
                .foregroundStyle(.black)
                .buttonStyle(.glass)
                .padding()
            }
            .padding()
        }
    func fetchMeal() {
         
      }
  }


    

struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let mealName: String
    let strInstructions: String
    let mealImage: String
}


#Preview {
    RecommendationView()
}
