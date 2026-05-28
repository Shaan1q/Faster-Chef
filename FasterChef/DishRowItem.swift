import SwiftUI

struct DishRowItem: View {

    let dish: Dish

    @EnvironmentObject var favoritesManager: FavoritesManager

    private var fixedImgURL: URL? {
        URL(
            string: dish.strMeal
                .replacingOccurrences(of: "\\", with: "")
        )
    }

    var body: some View {

        VStack(spacing: 10) {

            ZStack(alignment: .topTrailing) {

                AsyncImage(url: URL(string: dish.strMealThumb)) { image in

                    image
                        .resizable()
                        .scaledToFill()

                } placeholder: {

                    ProgressView()
                }
                .frame(width: 160, height: 160)
                .clipped()
                .cornerRadius(15)
                
                Image(
                    systemName:
                        favoritesManager.isFavorite(dish)
                        ? "heart.fill"
                        : "heart"
                )
                .padding(8)
                .foregroundStyle(.red)
                .font(.title2)
            }

            Text(dish.strMeal)
                .lineLimit(1)
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .foregroundStyle(.white)
        }
        .frame(width: 160)
        .onTapGesture(count: 2) {

            favoritesManager.toggle(dish)
        }
    }
}


