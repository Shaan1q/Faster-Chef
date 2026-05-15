//
//  DishCard.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct DishCard: View {
    var dish: Dish
    
    var fixedImgURL: URL? {
        URL(string: dish.strMealThumb.replacingOccurrences(of: "\\", with: ""))
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundStyle(Color("CardBgColor"))
            .frame(height: 200)
            .shadow(color: .black, radius: 4, x: 2, y: 3)
            .overlay {
                HStack {
                    Spacer()

                    VStack {
                        Text("Name: \(dish.strMeal)")
                        Text("Category: \(dish.strCategory)")
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .font(.headline)

                    AsyncImage(url: fixedImgURL) { receivedImage in
                        receivedImage
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        ProgressView()
                    }

                    Spacer()
                }
            }
            .padding([.leading, .trailing])
    }
}

#Preview {
    DishCard(dish: Dish(idMeal: "1235", strMeal: "Spicy Arrabiata Penne", strCategory: "Vegetarian", strMealThumb: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg", strArea: "Italy", strInstructions: "test"))
        .environment(NetworkClient())
}
