import SwiftUI

struct RecommendationView: View {
    @State private var meal: Meal?
    @State private var showMealDetail = false
    
    var body: some View {
        VStack {
            Text ("Recommendations")
                .font(.title)
                .fontDesign(.serif)
                .bold()
            HStack{
                Image("P1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                    )
                    .clipped()

                Image("P2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                    )
                    .clipped()


            }
            HStack{
                Image("P3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                    )
                    .clipped()
                Image("P4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                    )
                    .clipped()

                    .padding()
                    .applyBrandBackground()
            }
        }
        
        
//        VStack (spacing: 20){
//            Text ("Recommendations")
//                .fontDesign(.serif)
//                .font(.largeTitle)
//                .bold()
//        
//            VStack(spacing: 20) {
//                if let meal = meal {
//                    Text(meal.strMeal)
//                        .font(.title)
//                        .fontDesign(.serif)
//                     
//                    
//                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
//                        image.resizable()
//                            .scaledToFit()
//                            .frame(height: 300)
//                            .cornerRadius(15)
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
//                               .overlay(
//                                   RoundedRectangle(cornerRadius: 25)
//                                       .stroke(Color.white, lineWidth: 4)
//                                   )
//                            .shadow(radius: 8)
//                            .onTapGesture {
//                                showMealDetail = true
//                            }
//                           
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    
//                   
//                } else {
//                    Text("Tap the button for a recommendation!")
//                        .fontDesign(.serif)
//                }
//                
//                Button("🍽️ Get Meal 🍽️") {
//                    fetchMeal()
//                }
//                .padding()
//                .fontDesign(.serif)
//                .buttonStyle(.glass)
//            }
//            
//        }
//        .padding()
//        .applyBrandBackground()
//        .sheet (isPresented: $showMealDetail){
//            if let meal = meal {
//                MealDetailView(meal: meal)
//            }
//        }
//        
//        
//    }
//
//    func fetchMeal() {
//        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let data = data {
//                do {
//                    let decoded = try JSONDecoder().decode(MealResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        self.meal = decoded.meals.first
//                    }
//                } catch {
//                    print("Decoding error:", error)
//                }
//            }
//        }.resume()
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

struct MealDetailView: View {
    let meal: Meal

    var body: some View {
        ZStack{
            let color1 = Color(red: 0xf8/255, green: 0xc1/255, blue: 0x1c/255)
            let color2 = Color(red: 0xde/255, green: 0x6e/255, blue: 0x0c/255)
            let color3 = Color(red: 0xbc/255, green: 0x3a/255, blue: 0x17/255)
            LinearGradient(
                    gradient: Gradient(colors: [color3, color2]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(color1)
                            .shadow(color: .black, radius: 5, x: 2, y: 2)
                        Text(meal.strMeal)
                            .font(.title)
                            .bold()
                            .fontDesign(.serif)
                    }
                    
                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(12)
                            .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 4)
                            )
                    
                 .shadow(radius: 8)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.serif)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                      RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(color1)
                            .shadow(color: .black, radius: 5, x: 2, y: 2)
                        Text(meal.strInstructions)
                            .font(.body)
                            .fontWeight(.light)
                            .fontDesign(.serif)
                            .padding()
                    }
                 
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    RecommendationView()
}

