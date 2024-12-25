//
//  SeriesModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 25/12/24.
//

import Foundation

struct TopSeries: Decodable, Identifiable {
    let id: Int
    let name: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let first_air_date: String
    let vote_average: Double
    let vote_count: Int
}

struct TopSeriesResponse: Decodable {
    let results: [TopSeries]
}

struct DiscoverSeries: Decodable, Identifiable {
    let id: Int
    let name: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let first_air_date: String
    let vote_average: Double
    let vote_count: Int
}

struct DiscoverSeriesResponse: Decodable {
    let results: [DiscoverSeries]
}

