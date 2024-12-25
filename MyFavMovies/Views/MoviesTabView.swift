//
//  ContentView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import SwiftUI

struct MoviesTabView: View {
    var body: some View {
        TabView {
            Tab("Movies", systemImage: "movieclapper") {
                MoviesView()
            }
            
            Tab("Series", systemImage: "camera") {
                SeriesView()
            }
            
            Tab("Favorites", systemImage: "star") {
                FavoritesView()
            }
            
        }
        .accentColor(Color("brandPrimary"))
        
    }
}

#Preview {
    MoviesTabView()
}
