//
//  DishCard.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct DishCard: View {
    var dish: Dish
    
    var body: some View{
        RoundedRectangle(cornerRadius: 40)
            .foregroundStyle(.blue)
            .frame(height: 200)
            .overlay{
                HStack{
                    
                    Text(dish.strMeal)
                    
                }
            }
            .padding([.leading, .trailing])
    }
}

#Preview {
    DishCard(dish: Dish(idMeal: 1235, strMeal: "test", strCategory: "test"))
}
