import SwiftUI

struct RecommendationView: View {
    @State private var meal: Meal?

    var body: some View {
        VStack (spacing: 20){
            Text ("Recommendations")
                .fontDesign(.serif)
                .font(.largeTitle)
                .bold()
        
            VStack(spacing: 20) {
                if let meal = meal {
                    Text(meal.strMeal)
                        .font(.title)
                        .fontDesign(.serif)
                     
                    
                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(15)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                               .overlay(
                                   RoundedRectangle(cornerRadius: 25)
                                       .stroke(Color.white, lineWidth: 4)
                                   )
                            .shadow(radius: 8)
                           
                    } placeholder: {
                        ProgressView()
                    }
                    
                   
                } else {
                    Text("Tap the button for a recommendation!")
                        .fontDesign(.serif)
                }
                
                Button("🍽️ Get Meal 🍽️") {
                    fetchMeal()
                }
                .padding()
                .fontDesign(.serif)
                .buttonStyle(.glass)
            }
            
        }
     
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

