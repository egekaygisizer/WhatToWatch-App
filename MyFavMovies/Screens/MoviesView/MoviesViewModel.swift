//
//  MoviesViewModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 23/12/24.
//

import Foundation

final class MoviesViewModel: ObservableObject {

    @Published var topMovies: [TopMovies] = []
    @Published var discoverMovies : [DiscoverMovies] = []
    @Published var allTimeMovies : [AllTimeMovies] = []
    
    func getTopMovies() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchTopMovies) { topMovies in
            self.topMovies = Array(topMovies.prefix(5))
        }
    }

    func getDiscoverMovies() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchDiscoverMovies) { discoverMovies in
            self.discoverMovies = discoverMovies
        }
    }
    
    func getAllTimeMovies() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchAllTimeMovies) { allTimeMovies in
            self.allTimeMovies = allTimeMovies
        }
    }
    

    
}


