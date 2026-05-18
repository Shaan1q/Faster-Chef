//
//  SearchView.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct SearchView: View {
    @Environment(NetworkClient.self) private var networkClient
    @State private var searchText = ""
    @State private var showSearchResults = false
    @State private var searched = false
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.searchBar)
                        .frame(width: 500, height: 130, alignment: .top)
                    HStack(spacing: -170){
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
                        
                        Text("Search    ")
                            .font(Font.system(size: 40, weight: .bold, design: .rounded))
                    }
                }
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search for a dish", text: $searchText)
                        .submitLabel(.search)
                        .onSubmit {
                            searched = true
                            submitSearch()
                        }
                }
                .padding(10)
                .font(.system(size: 18))
                .background(Color.white)
                .cornerRadius(12)
                .frame(height: 45)
                .padding(.horizontal, 60)
                .shadow(radius: 2)
                
                ScrollView {
                    if !searched {
                        Text("Search for any dish!")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity)
                        
                    } else if networkClient.searchResults.isEmpty {
                        
                        Text("No dishes found")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity)
                        
                    } else {
                        
                        Text("Search Results for \(searchText)")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity)
                        
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ],
                            spacing: 25
                        ) {
                            
                            ForEach(networkClient.searchResults) { dish in
                                
                                NavigationLink {
                                    DishDetailView(selectedDish: dish)
                                } label: {
                                    DishRowItem(dish: dish)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding()
                    }
                    
                }
                
            }
            .applyBrandBackground()
        }
    }
    private func submitSearch() {
        Task {
            await networkClient.getDishFromName(name: searchText)
            showSearchResults = true
            searchText = ""
        }
    }
}


#Preview {
    SearchView().environment(NetworkClient())
}
