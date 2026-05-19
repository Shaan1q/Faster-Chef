//
//  FavoritesView.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//
import SwiftUI

struct FavoritesView: View {

    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
                VStack {
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.cardBg)
                            .frame(width: 500, height: 130, alignment: .top)
                        HStack(spacing: -170) {
                            Circle()
                                .fill(Color.white)
                                .stroke(Color.black, lineWidth: 3)
                                .frame(width: 380, height: 160, alignment: .leading)
                                .overlay(
                                    Image(systemName: "heart.circle")
                                        .foregroundColor(Color.black)
                                        .font(Font.system(size: 100, weight: .light, design: .default))
                                        .frame(width: 339, height: 40, alignment: .leading)
                                )
                            
                            Text("Favourites")
                                .font(Font.system(size: 40, weight: .bold, design: .rounded))
                        }
                    }
            if favoritesManager.favoriteDishes.isEmpty {

                Spacer()

                VStack(spacing: 15) {

                    Image(systemName: "heart.slash")
                        .font(.system(size: 60))

                    Text("No Favorites Yet")
                        .font(.title2.bold())

                    Text("Double tap a dish to add it.")
                        .foregroundStyle(.secondary)
                }

                Spacer()

            } else {

                ScrollView {

                    LazyVStack(spacing: 20) {

                        ForEach(favoritesManager.favoriteDishes) { dish in

                            DishRowItem(dish: dish)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Favorites")
    }
}

