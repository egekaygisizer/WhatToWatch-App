//
//  ContentView.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import SwiftUI

class TabSelection: ObservableObject {
    @Published var selectedTab: Int = 0 // Aktif tabı takip eden sınıf
}

struct MoviesTabView: View {
    
    @StateObject private var tabSelection = TabSelection()
    
    var body: some View {
        TabView(selection: $tabSelection.selectedTab) {
            
            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "movieclapper")
                }
                .tag(0)
            
            SeriesView()
                .tabItem {
                    Label("Series", systemImage: "camera")
                }
                .tag(1)
            
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .tag(2)
        }
        .environmentObject(tabSelection)
        
        .accentColor(Color("brandPrimary"))
        
    }
}

#Preview {
    MoviesTabView()
}
