//
//  FavoritesView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//
import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var tabSelection: TabSelection
    @EnvironmentObject var favoriteMovie: FavoriteMovies
    @EnvironmentObject var favoriteSeries: FavoriteSeries

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if favoriteMovie.favoriteMovies.isEmpty && favoriteSeries.favoriteSeries.isEmpty {
                        EmptyFavoritesView()
                            .padding(.vertical, 45)
                    } else {
                        // Movies Section
                        CategoryTitle(category: "Movies")
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(favoriteMovie.favoriteMovies.map { AnyMovie($0) }) { movie in
                                    NavigationLink(
                                        destination: MoviesDetailView(movie: movie)
                                    ) {
                                        MovieCell(movie: movie)
                                    }
                                    .foregroundStyle(Color(.label))
                                }
                            }
                        }
                        .padding(.horizontal)

                        // Series Section
                        CategoryTitle(category: "Series")
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(favoriteSeries.favoriteSeries.map { AnySeries($0) }) { series in
                                    NavigationLink(
                                        destination: SeriesDetailView(series: series)
                                    ) {
                                        SeriesCell(series: series)
                                    }
                                    .foregroundStyle(Color(.label))
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}


#Preview {
    FavoritesView()
        .environmentObject(TabSelection())
        .environmentObject(FavoriteMovies())
        .environmentObject(FavoriteSeries())
}

struct MovieCell : View {
    var movie: AnyMovie
    
    var body: some View {
        FavoritesListCell(
            posterPath: movie.poster_path ?? "",
            movieTitle: movie.title
        )
    }
}

struct SeriesCell : View {
    var series: AnySeries
    
    var body: some View {
        FavoritesListCell(
            posterPath: series.poster_path ?? "",
            movieTitle: series.name
        )
    }
}
