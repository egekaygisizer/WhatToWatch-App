//
//  SeriesModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 25/12/24.
//

import Foundation

protocol Series: Identifiable {
    var id: Int { get }
    var name: String { get }
    var overview: String { get }
    var poster_path: String? { get }
    var backdrop_path: String? { get }
    var first_air_date: String { get }
    var vote_average: Double { get }
    var vote_count: Int { get }
}

struct TopSeries: Decodable, Identifiable, Series {
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

struct DiscoverSeries: Decodable, Identifiable, Series {
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

struct AllTimeSeries: Decodable, Identifiable, Series {
    let id: Int
    let name: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let first_air_date: String
    let vote_average: Double
    let vote_count: Int
}

struct AllTimeSeriesResponse: Decodable {
    let results: [AllTimeSeries]
}


