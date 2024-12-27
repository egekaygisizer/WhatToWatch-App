//
//  SeriesDetailModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 26/12/24.
//

import Foundation

struct SeriesDetailModel: Identifiable, Decodable {
    var id: Int
    var genres: [SeriesDetailGenres]
    var number_of_seasons: Int
    var number_of_episodes: Int
    var seasons: [SeriesDetailSeasons]
    
}

struct SeriesDetailGenres: Identifiable, Decodable {
    var id: Int
    var name: String
}

struct SeriesDetailSeasons: Identifiable, Decodable {
    var id: Int
    var name: String
    var overview: String
    var episode_count: Int
    var poster_path: String
    var vote_average: Double
}
