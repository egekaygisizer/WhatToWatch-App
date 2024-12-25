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
    

    // Get Top Movies
    func getTopMovies() {
        NetworkManager.shared.getNetworkCall(fetchFunction: NetworkManager.shared.fetchTopMovies) { topMovies in
            self.topMovies = Array(topMovies.prefix(5))
        }
    }

    // Get Discover Movies
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
    
//    func getNetworkCall( savedArray: [] = [], fetchFunc: @escaping () -> Void) {
//        NetworkManager.shared.fetchFunc { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let movies):
//                    self.
//                }
//            }
//        }
//    }
//    
//     
//    func getTopMovies() {
//        NetworkManager.shared.fetchTopMovies { result in
//            DispatchQueue.main.async {
//                switch result {
//                    case .success(let topMovies):
//                    self.topMovies = Array(topMovies.prefix(5))
//                    case .failure(let error):
//                        print("Failed to fetch movies: \(error)")
//                    }
//            }
//        }
//    }
//    
//    func getDiscoverMovies() {
//        NetworkManager.shared.fetchDiscoverMovies { result in
//            DispatchQueue.main.async {
//                switch result {
//                    case .success(let discoverMovies):
//                    self.discoverMovies = discoverMovies
//                    case .failure(let error):
//                        print("Failed to fetch movies: \(error)")
//                    }
//            }
//        }
//    }
    
    
    
}


