//
//  FavoriteMovieModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 26/12/24.
//

import SwiftUI

final class FavoriteMovies: ObservableObject {
    
    @Published var favoriteMovies: [AnyMovie] = []
    
    func addToFavorites(movie: any Movie) {
            let anyMovie = AnyMovie(movie)
            favoriteMovies.append(anyMovie)
        }
    
    func removeFromFavorites(movie: any Movie) {
        favoriteMovies.removeAll { $0.id == movie.id }
    }
    
    func isFavorite(movie: any Movie) -> Bool {
        return favoriteMovies.contains(where: { $0.id == movie.id })
    }
    
    
}
