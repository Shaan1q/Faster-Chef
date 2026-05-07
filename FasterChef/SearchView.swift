//
//  SearchView.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct SearchView: View {
    @Environment(NetworkClient.self) private var networkClient
    @State private var selectedDish: Dish?

    var body: some View {
        VStack{
                ZStack{
                    Rectangle()
                    .fill(Color.searchBar)
                     .frame(width: 500, height: 130, alignment: .top)
                    HStack(spacing: -200){
                        Circle()
                            .fill(Color.white)
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 380, height: 160, alignment: .leading)
                            .overlay(
                        Image(systemName: "magnifyingglass.circle")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 100, weight: .light, design: .default))
                            .frame(width: 339, height: 40, alignment: .leading)
                        )
                        Text("   Search    ")
                            .font(Font.system(size: 40, weight: .bold, design: .rounded))
                    }

                }
            Spacer()
        }
//        ZStack {
//            Color(.lightGray)
//                .ignoresSafeArea()
//            ScrollView(.vertical) {
//                LazyVStack {
//                    ForEach(networkClient.searchResults) { dish in
//                        DishCard(dish: dish)
//                            .onTapGesture {
//                                selectedDish = dish
//                            }
//                    }
//                }
//            }
//            .sheet(item: $selectedDish) { tappedDish in
//                DishDetailView(selectedDish: tappedDish)
//                    .presentationDetents([.medium, .large])
//            }
//        }
    }
}


#Preview {
    SearchView().environment(NetworkClient())
}
