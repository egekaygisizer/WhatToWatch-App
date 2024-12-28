//
//  FavoriteButton.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 27/12/24.
//

import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void = {}
    
    var body: some View {
        Button (action: action) {
            Text(isFavorite ? "Remove from Favorite" : "Add to Favorite")
                .frame(width: 190,height: 50)
                .font(.title3)
                .fontWeight(.medium)
            Image(systemName: isFavorite ? "star.fill" : "star")
                .frame(width: 40)
                .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .tint(isFavorite ? .red : Color("brandPrimary"))
    }
}

#Preview {
    FavoriteButton(isFavorite: true)
}
