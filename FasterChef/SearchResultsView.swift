import SwiftUI

struct SearchResultsView: View {

    @Environment(NetworkClient.self) private var networkClient

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        ZStack {
            ScrollView {

                if networkClient.searchResults.isEmpty {

                    Text("No dishes found")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(.top, 50)

                } else {

                    LazyVGrid(columns: columns, spacing: 25) {

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
        .navigationTitle("Search Results")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {
        SearchResultsView()
            .environment(NetworkClient())
    }
}
