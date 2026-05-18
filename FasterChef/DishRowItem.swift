import SwiftUI

struct DishRowItem: View {

    let dish: Dish

    var body: some View {

        VStack(spacing: 10) {

            let fixedImgURL = URL(
                string: dish.strMealThumb
                    .replacingOccurrences(of: "\\", with: "")
            )

            AsyncImage(url: fixedImgURL) { receivedImage in

                receivedImage
                    .resizable()
                    .scaledToFill()

            } placeholder: {

                ProgressView()
            }
            .frame(width: 175, height: 175)
            .clipped()
            .cornerRadius(15)

            .overlay {

                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.favoriteBar, lineWidth: 5)
            }

            Text(dish.strMeal)
                .lineLimit(1)
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }

        .frame(width: 160)
    }
}

#Preview {

    DishRowItem(
        dish: Dish(
            idMeal: "52771",
            strMeal: "Spicy Arrabiata Penne",
            strCategory: "Vegetarian",
            strMealThumb:
                "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
            strArea: "Italian",
            strInstructions: "Boil pasta and mix sauce."
        )
    )
}
