//
//  FavoritesListCell.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 27/12/24.
//

import SwiftUI

struct FavoritesListCell: View {
    
    var posterPath: String
    var movieTitle: String
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
            }
            
//            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
//                image.resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 180)
//                    .cornerRadius(10)
//            } placeholder: {
//                Image(systemName: "photo.on.rectangle.angled")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 180)
//                    .cornerRadius(10)
//            }
            
            VStack {
                Text(movieTitle)
                    .frame(width: 140)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Text("5m ago added favorites")
                    .frame(width: 140)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
            }
        }
        .onAppear {loadImage()}
        .padding(.bottom, 8)
    }
    
    private func loadImage() {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
    
}

#Preview {
    FavoritesListCell(posterPath: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg", movieTitle: "Example Title")
}
