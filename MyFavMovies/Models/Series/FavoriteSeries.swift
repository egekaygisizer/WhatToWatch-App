//
//  FavoriteSeries.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 28/12/24.
//

import SwiftUI

final class FavoriteSeries: ObservableObject {
    
    @Published var favoriteSeries: [any Series] = []
    
    func addToFavorites(series: any Series) {
            let anySeries = AnySeries(series) 
            favoriteSeries.append(anySeries)
        }
    
    func removeFromFavorites(series: any Series) {
        favoriteSeries.removeAll { $0.id == series.id }
    }
    
    func isFavorite(series: any Series) -> Bool {
        return favoriteSeries.contains(where: { $0.id == series.id })
    }
}
