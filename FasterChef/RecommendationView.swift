import SwiftUI

struct RecommendationView: View {
    @State private var meal: Meal?

    var body: some View {
        VStack {
            Text ("Recommendations")
                .font(.title)
                .bold()
        
            VStack(spacing: 20) {
                if let meal = meal {
                    Text(meal.strMeal)
                        .font(.title)
                        .bold()
                    
                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    
                   
                } else {
                    Text("Tap the button to for a recommendation! 🍽️")
                }
                
                Button("Get Random Meal") {
                    fetchMeal()
                }
                .padding()
            }
            
        }
        .padding()
        .applyBrandBackground()
        
    }

    func fetchMeal() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(MealResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.meal = decoded.meals.first
                    }
                } catch {
                    print("Decoding error:", error)
                }
            }
        }.resume()
    }
}




struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
}

#Preview {
    RecommendationView()
}

