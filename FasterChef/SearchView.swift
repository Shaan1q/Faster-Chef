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
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(networkClient.searchResults) { dish in
                        DishCard(dish: dish)
                            .onTapGesture {
                                selectedDish = dish
                            }
                    }
                }
            }
            .sheet(item: $selectedDish) { tappedDish in
                DishDetailView(selectedDish: tappedDish)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}


#Preview {
    SearchView().environment(NetworkClient())
}
