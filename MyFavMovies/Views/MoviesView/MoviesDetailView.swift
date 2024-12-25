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
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .center) {
                // Blurry Background Image
                MovieBlurBackground(movie: movie)
                
                // Movie image and title
                MovieImageTitle(movie: movie)
            }
            
            // Movie overview, rating, release date
            MovieDescription(movie: movie)
        }
    }
}

#Preview {
    MoviesDetailView(movie: MockData.sampleMovies as Movie)
}

struct MovieBlurBackground: View {
    let movie: Movie
    
    var body: some View {
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
    }
}

struct MovieImageTitle: View {
    let movie: Movie
    
    var body: some View {
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
            
            Text(movie.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 5) // Başlığın okunabilirliği için gölge ekledim.
        }
    }
}

struct MovieDescription: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(movie.overview)
                .font(.body)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 8) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                HStack(alignment: .bottom) {
                    Text("\(movie.vote_average, specifier: "%.1f")")
                        .font(.headline)
                    Text("(\(movie.vote_count))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 2)
                }
                
            }
            
            Text("Release Date: \(movie.release_date)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
