//
//  MoviesViewListCell.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 23/12/24.
//

import SwiftUI

struct ContentViewListCell: View {
    
    var imageURL: String
    var notLoadImage: String
    var movieTitle: String
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageURL)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
            } placeholder: {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
            }
            
            Text(movieTitle)
            .frame(width: 130,height: 50)
            .font(.title3)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .lineLimit(2)
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    ContentViewListCell(imageURL: "https,://image.tmdb.org/t/p/w500", notLoadImage: "examplePoster", movieTitle: "Example Title")
}
