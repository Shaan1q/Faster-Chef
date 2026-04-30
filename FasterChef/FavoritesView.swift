//
//  FavoritesView.swift
//  FasterChef
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
       VStack{
               ZStack{
                   Rectangle()
                   .fill(Color.niceYellow)
                    .frame(width: 500, height: 130, alignment: .top)
                   HStack(spacing: -200){
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
           Spacer()
       }
        
    }
}

#Preview {
    FavoritesView()
}
