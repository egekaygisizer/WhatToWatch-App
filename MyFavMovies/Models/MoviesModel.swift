//
//  TopMoviesModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import Foundation

protocol Movie {
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var poster_path: String? { get }
    var backdrop_path: String? { get }
    var release_date: String { get }
    var vote_average: Double { get }
    var vote_count: Int { get }
}

struct TopMovies : Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let release_date: String
    let vote_average: Double
    let vote_count: Int
}

struct TopMoviesResponse: Decodable {
    let results: [TopMovies]
}

struct DiscoverMovies : Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let release_date: String
    let vote_average: Double
    let vote_count: Int
}

struct DiscoverMoviesResponse : Decodable {
    let results: [DiscoverMovies]
}

struct AllTimeMovies: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let release_date: String
    let vote_average: Double
    let vote_count: Int
}

struct AllTimeMoviesResponse : Decodable {
    let results: [AllTimeMovies]
}



struct MockData {
    
    static let sampleMovies = TopMovies(id: 01,
                                           title: "Santa Claus",
                                           overview: "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
                                           poster_path: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                                           backdrop_path: "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
                                           release_date: "2021-07-14",
                                           vote_average: 8.5,
                                           vote_count: 100)
    
    static let sampleSeries = TopSeries(id: 02,
                                        name: "The Office",
                                        overview: "The Office is an American television sitcom created by Michael Scott and Pamela Scott. It is set in the fictional offices of the fictional fictional office of Michael Scott and Pamela Scott, in the fictional city of Pawnee, Indiana.",
                                        poster_path: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                                        backdrop_path: "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
                                        first_air_date: "2021-07-14",
                                        vote_average: 8.5,
                                        vote_count: 100)
}
