//
//  FavoriteButton.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 27/12/24.
//

import SwiftUI

struct FavoriteButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Add to Favorite")
                .frame(width: 170,height: 50)
                .font(.title3)
                .fontWeight(.medium)
            Image(systemName: "star")
                .frame(width: 40)
                .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    FavoriteButton()
}
