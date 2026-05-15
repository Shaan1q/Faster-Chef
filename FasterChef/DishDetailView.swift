
import SwiftUI

struct DishDetailView: View {
    
    @Environment(NetworkClient.self) private var networkClient
    let selectedDish: Dish
    
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
                        Text(selectedDish.strMeal)
                            .font(.title)
                            .bold()
                            .fontDesign(.serif)
                    }
                    
                    AsyncImage(url: URL(string: selectedDish.strMealThumb)) { image in
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
                        Text(selectedDish.strInstructions)
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
    DishDetailView(selectedDish: Dish(idMeal: "1235", strMeal: "Spicy Arrabiata Penne", strCategory: "Vegetarian", strMealThumb: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg", strArea: "Italy", strInstructions: "test instructions test instructions test instructions test instructions test instructions test instructions test instructions")).environment(NetworkClient())
}
