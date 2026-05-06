
import SwiftUI

struct DishDetailView: View {
    
    @Environment(NetworkClient.self) private var networkClient
    let selectedDish: Dish
    
    var body: some View {
        ZStack{
            Color(red: 1, green: 0.75, blue: 0.8)
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 16) {
                    ScrollView(.vertical) {
                        VStack(alignment: .center, spacing: 16) {
                            Text(selectedDish.strMeal)
                                .multilineTextAlignment(.center)
                                .font(.system(.largeTitle, design: .monospaced, weight: .heavy))
                                .shadow(color: .red, radius: 1)
                                .bold()
                            
//                            let fixedImgURL = URL(string: selectedDish.strMealThumb.replacingOccurrences(of: "\\", with: ""))
//                            AsyncImage(url: fixedImgURL) { receivedImage in
//                                receivedImage
//                                    .resizable()
//                                    .frame(width: 150, height: 150)
//                                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                                
//                            } placeholder: {
//                                ProgressView()
//                            }
//                            
                            Text(networkClient.selectedDishDetails.strArea)
                                .multilineTextAlignment(.center)
                                .font(.system(.title2, design: .monospaced, weight: .medium))
                                .bold()
                            
                            if (networkClient.selectedDishDetails.strInstructions != " ") {
                                ZStack {
                                    let darkerBlue = Color(red: 0.322, green: 0.506, blue: 0.749, opacity: 1)
                                    let lighterBlue = Color(red: 0.518, green: 0.663, blue: 0.851, opacity: 1)
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(darkerBlue)
                                        .shadow(color: .black, radius: 5, x: 2, y: 2)
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(lighterBlue)
                                                .shadow(color: .black, radius: 3, x: 1, y: 1)
                                            Text("Overview")
                                                .font(.system(.title2, design: .monospaced, weight: .medium))
                                                .padding(2)
                                        }
                                        .padding(.bottom, 8)
                                        Text(networkClient.selectedDishDetails.strInstructions)
                                            .font(.system(.body, design: .monospaced, weight: .light))
                                            .layoutPriority(1) 
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: 340)
                            }
                        }
                    }
                }
            }
        }
    }
}

    
#Preview {
    DishDetailView(selectedDish: Dish(idMeal: 1235, strMeal: "Spicy Arrabiata Penne", strCategory: "Vegetarian", strMealThumb: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")).environment(NetworkClient())
}
