import SwiftUI

struct RecommendationView: View {

    @Environment(NetworkClient.self) var networkClient

    @State private var showDishDetail = false

    
    var body: some View {

        VStack {

            // HEADER
            ZStack {
                
                Rectangle()
                    .fill(Color.recBar)
                    .frame(height: 130)
                
                HStack(spacing: 10) {
                    Circle()
                        .fill(Color.white)
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 160, height: 160)
                        .overlay(
                            Image(systemName: "magnifyingglass.circle")
                                .foregroundStyle(.black)
                                .font(.system(size: 100, weight: .light))
                        )
                    
                    Text("Chefs' Picks")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)
                }
            }

           
            Spacer()

            VStack {

                Text("🍽️ Click a chef for a meal! 🍽️")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding(.bottom)

                HStack(spacing: 20) {

                    Image("P1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .onTapGesture {
                            Task {
                                await networkClient.getRandomDish()
                                showDishDetail = true
                            }
                        }

                    Image("P2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .onTapGesture {
                            Task {
                                await networkClient.getRandomDish()
                                showDishDetail = true
                            }
                        }
                }

                HStack(spacing: 20) {

                    Image("P3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .onTapGesture {
                            Task {
                                await networkClient.getRandomDish()
                                showDishDetail = true
                            }
                        }

                    Image("P4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .onTapGesture {
                            Task {
                                await networkClient.getRandomDish()
                                showDishDetail = true
                            }
                        }
                }
            }
            .padding()

            Spacer()
            Spacer()
        }
        .sheet(isPresented: $showDishDetail) {
            if let dish = networkClient.randomDish {
                DishDetailView(selectedDish: dish)
            }
        }
    }
}

#Preview {
    RecommendationView()
        .environment(NetworkClient())
}
