//
//  TopMoviesModel.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import Foundation

struct AnyMovie: Movie {
    private let _id: Int
    private let _title: String
    private let _overview: String
    private let _poster_path: String?
    private let _backdrop_path: String?
    private let _release_date: String
    private let _vote_average: Double
    private let _vote_count: Int
    
    var id: Int { _id }
    var title: String { _title }
    var overview: String { _overview }
    var poster_path: String? { _poster_path }
    var backdrop_path: String? { _backdrop_path }
    var release_date: String { _release_date }
    var vote_average: Double { _vote_average }
    var vote_count: Int { _vote_count }
    
    init<M: Movie>(_ movie: M) {
        self._id = movie.id
        self._title = movie.title
        self._overview = movie.overview
        self._poster_path = movie.poster_path
        self._backdrop_path = movie.backdrop_path
        self._release_date = movie.release_date
        self._vote_average = movie.vote_average
        self._vote_count = movie.vote_count
    }
}

protocol Movie: Identifiable, Equatable {
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var poster_path: String? { get }
    var backdrop_path: String? { get }
    var release_date: String { get }
    var vote_average: Double { get }
    var vote_count: Int { get }
}

struct TopMovies : Decodable, Identifiable, Movie {
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

struct DiscoverMovies : Decodable, Identifiable, Movie {
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

struct AllTimeMovies: Decodable, Identifiable, Movie {
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
    
    static let sampleSeries = TopSeries(id: 1396,
                                        name: "Breaking Bad",
                                        overview: "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
                                        poster_path: "/ineLOBPG8AZsluYwnkMpHRyu7L.jpg",
                                        backdrop_path: "/alb2BU2BeBZv5dgHhuzV9ZGakfZ.jpg",
                                        first_air_date: "2021-07-14",
                                        vote_average: 8.918,
                                        vote_count: 14681)
    
    static let sampleSeriesDetail = SeriesDetailModel(id: 1396,
                                                      genres: [SeriesDetailGenres(id: 13, name: "Crime"),
                                                               SeriesDetailGenres(id: 13, name: "Action")],
                                                      number_of_seasons: 5,
                                                      number_of_episodes: 65,
                                                      seasons: [SeriesDetailSeasons(id: 13, name: "Season 1", overview: "This is a sample season episode overview", episode_count: 7, poster_path: "/ineLOBPG8AZsluYwnkMpHRyu7L.jpg", vote_average: 8.4)])
    
    static let sampleMoviesTwo = TopMovies(id: 02,
                                           title: "Santa Claus",
                                           overview: "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
                                           poster_path: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                                           backdrop_path: "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
                                           release_date: "2021-07-14",
                                           vote_average: 8.5,
                                           vote_count: 100)
    
    static let sampleMoviesThree = TopMovies(id: 03,
                                           title: "Santa Claus",
                                           overview: "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
                                           poster_path: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                                           backdrop_path: "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
                                           release_date: "2021-07-14",
                                           vote_average: 8.5,
                                           vote_count: 100)
    
    static let sampleMoviesFour = TopMovies(id: 04,
                                           title: "Santa Claus",
                                           overview: "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
                                           poster_path: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                                           backdrop_path: "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
                                           release_date: "2021-07-14",
                                           vote_average: 8.5,
                                           vote_count: 100)
    
    static let sampleSeriesTwo = TopSeries(id: 1397,
                                        name: "Breaking Bad",
                                        overview: "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
                                        poster_path: "/ineLOBPG8AZsluYwnkMpHRyu7L.jpg",
                                        backdrop_path: "/alb2BU2BeBZv5dgHhuzV9ZGakfZ.jpg",
                                        first_air_date: "2021-07-14",
                                        vote_average: 8.918,
                                        vote_count: 14681)
    
    static let sampleSeriesThree = TopSeries(id: 1398,
                                        name: "Breaking Bad",
                                        overview: "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
                                        poster_path: "/ineLOBPG8AZsluYwnkMpHRyu7L.jpg",
                                        backdrop_path: "/alb2BU2BeBZv5dgHhuzV9ZGakfZ.jpg",
                                        first_air_date: "2021-07-14",
                                        vote_average: 8.918,
                                        vote_count: 14681)
    
    static let sampleSeriesFour = TopSeries(id: 1399,
                                        name: "Breaking Bad",
                                        overview: "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
                                        poster_path: "/ineLOBPG8AZsluYwnkMpHRyu7L.jpg",
                                        backdrop_path: "/alb2BU2BeBZv5dgHhuzV9ZGakfZ.jpg",
                                        first_air_date: "2021-07-14",
                                        vote_average: 8.918,
                                        vote_count: 14681)
    
    static let sampleMoviesList = [sampleMovies, sampleMoviesTwo, sampleMoviesThree, sampleMoviesFour]
    static let sampleSeriesList = [sampleSeries, sampleSeriesTwo, sampleSeriesThree, sampleSeriesFour]
    
}
