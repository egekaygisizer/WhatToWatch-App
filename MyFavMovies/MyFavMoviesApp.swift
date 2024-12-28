//
//  MyFavMoviesApp.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import SwiftUI

@main
struct MyFavMoviesApp: App {
    @StateObject private var favoriteMovies = FavoriteMovies()
    @StateObject private var favoriteSeries = FavoriteSeries()
    
    var body: some Scene {
        WindowGroup {
            MoviesTabView()
                .environmentObject(favoriteMovies)
                .environmentObject(favoriteSeries)
        }
    }
}
