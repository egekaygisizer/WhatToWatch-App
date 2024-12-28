//
//  SeriesModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 25/12/24.
//

import Foundation

struct AnySeries: Series {
    private let _id: Int
    private let _name: String
    private let _overview: String
    private let _poster_path: String?
    private let _backdrop_path: String?
    private let _first_air_date: String
    private let _vote_average: Double
    private let _vote_count: Int

    var id: Int { _id }
    var name: String { _name }
    var overview: String { _overview }
    var poster_path: String? { _poster_path }
    var backdrop_path: String? { _backdrop_path }
    var first_air_date: String { _first_air_date }
    var vote_average: Double { _vote_average }
    var vote_count: Int { _vote_count }

    init<S: Series>(_ series: S) {
        self._id = series.id
        self._name = series.name
        self._overview = series.overview
        self._poster_path = series.poster_path
        self._backdrop_path = series.backdrop_path
        self._first_air_date = series.first_air_date
        self._vote_average = series.vote_average
        self._vote_count = series.vote_count
    }
}

protocol Series: Identifiable, Equatable {
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


