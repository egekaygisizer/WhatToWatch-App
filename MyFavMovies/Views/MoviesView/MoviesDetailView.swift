//
//  MoviesDetailView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 23/12/24.
//

//
//  MoviesDetailView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 23/12/24.
//

import SwiftUI

struct MoviesDetailView: View {
    // Dinamik bir film modeli alıyoruz
    let movie: TopMovies
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .center) {
                // Blur arkaplan görseli
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path ?? "")")) { image in
                    image.resizable()
                        .blur(radius: 25)
                        .ignoresSafeArea()
                        .frame(height: 420)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                        .blur(radius: 25)
                        .ignoresSafeArea()
                        .frame(height: 420)
                }
                
                // Film posteri ve başlık
                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 300)
                            .cornerRadius(10)
                    } placeholder: {
                        Image(systemName: "photo.on.rectangle.angled")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 300)
                            .cornerRadius(10)
                            .foregroundColor(.gray)
                    }
                    
                    // Film başlığı
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .shadow(radius: 5) // Başlığın okunabilirliği için gölge ekledim.
                }
            }
            
            // Diğer içerikler (açıklama, puan ve çıkış tarihi)
            VStack(alignment: .leading, spacing: 16) {
                // Film açıklaması
                Text(movie.overview)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                
                // Film puanı
                HStack(spacing: 8) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", movie.vote_average))
                        .font(.headline)
                }
                
                // Film çıkış tarihi
                Text("Release Date: \(movie.release_date)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

#Preview {
    MoviesDetailView(movie: MockData.sampleMovies)
}
