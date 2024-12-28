//
//  MoviesView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
//    @EnvironmentObject var favoriteMovies : FavoriteMovies
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                CategoryTitle(category: "Top 5 Movies! Today")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.topMovies) { movie in
                            NavigationLink(
                                destination: MoviesDetailView(movie: movie)
                            ) {
                                ContentViewListCell(
                                    imageURL: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")",
                                    notLoadImage: "examplePoster",
                                    movieTitle: "\(movie.title)")
                            }
                            .foregroundStyle(Color(.label))
                                
                        }
                    }
                }
                
                CategoryTitle(category: "Discover Movies!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.discoverMovies) { movie in
                            NavigationLink(
                                destination: MoviesDetailView(movie: movie)
                            ) {
                                ContentViewListCell(
                                    imageURL: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")",
                                    notLoadImage: "examplePoster",
                                    movieTitle: "\(movie.title)")
                            }
                            .foregroundStyle(Color(.label))
                        }
                    }
                }
                
                CategoryTitle(category: "All Time Movies!")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.allTimeMovies) { movie in
                            NavigationLink(
                                destination: MoviesDetailView(movie: movie)
                            ) {
                                ContentViewListCell(
                                    imageURL: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")",
                                    notLoadImage: "examplePoster",
                                    movieTitle: "\(movie.title)")
                            }
                            .foregroundStyle(Color(.label))
                        }
                    }
                }
            }
            .navigationTitle("Movies 🎬")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getTopMovies()
                viewModel.getDiscoverMovies()
                viewModel.getAllTimeMovies()
            }
            
        }
    }
    
}

#Preview {
    MoviesView()
}

struct CategoryTitle: View {
    var category: String
    
    var body: some View {
        Text(category)
            .font(.title2)
            .bold()
            .padding(.top, 10)
    }
}

