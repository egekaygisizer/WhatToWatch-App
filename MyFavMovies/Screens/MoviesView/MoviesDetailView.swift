//
//  MoviesDetailView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 23/12/24.
//

import SwiftUI

struct MoviesDetailView: View {
    let movie: any Movie
    @EnvironmentObject var favoriteMovies: FavoriteMovies
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                // Hero section with backdrop and poster
                ZStack(alignment: .bottom) {
                    // Backdrop image
                    MovieBlurBackground(movie: movie)
                                        
                    // Movie poster and title
                    MovieImageTitle(movie: movie)
                        .padding(17)
                }
                
                VStack(spacing: 15) {
                    // Rating section
                    HStack(spacing: 3) {
                        RatingView(rating: movie.vote_average, voteCount: movie.vote_count)
                        
                        Spacer()
                        
                        FavoriteButton(isFavorite: favoriteMovies.isFavorite(movie: movie)) {
                            if favoriteMovies.isFavorite(movie: movie) {
                                favoriteMovies.removeFromFavorites(movie: movie)
                            } else {
                                favoriteMovies.addToFavorites(movie: movie)
                            }
                        }
                    }
                    .padding(.top, 16)
                    
                    // Movie details
                    MovieDescription(movie: movie)
                        .padding(.bottom, 20)
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct MovieBlurBackground: View {
    let movie: any Movie
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path ?? "")")) { image in
            image.resizable()
                .frame(height: 300)
                .blur(radius: 10)
        } placeholder: {
            Rectangle()
                .foregroundColor(.gray.opacity(0.3))
                .frame(height: 300)
                .blur(radius: 10)
        }
    }
}

struct MovieImageTitle: View {
    let movie: any Movie
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 16) {
            // Poster
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .cornerRadius(10)
                    .shadow(radius: 6)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            }
            
            // Title and release year
            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .lineLimit(3)
                
                Text(String(movie.release_date.prefix(4)))
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

struct RatingView: View {
    let rating: Double
    let voteCount: Int
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text(String(format: "%.1f", rating))
                    .fontWeight(.semibold)
            }
            Text("\(voteCount) votes")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}

struct MovieDescription: View {
    let movie: any Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Overview section
            VStack(alignment: .leading, spacing: 8) {
                Text("Overview")
                    .font(.headline)
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            // Release date
            VStack(alignment: .leading, spacing: 6) {
                Text("Release Date")
                    .font(.headline)
                Text(movie.release_date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    MoviesDetailView(movie: MockData.sampleMovies as (any Movie))
        .environmentObject(FavoriteMovies())
}
