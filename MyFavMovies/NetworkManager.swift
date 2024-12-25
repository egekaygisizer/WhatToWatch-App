//
//  NetworkManager.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 22/12/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let apiKey = "26057c9600d599f192bf24c0aea444a2"
    private let baseURL = "https://api.themoviedb.org/3"
    
    private init () {}
    
    
    private func performRequest<T: Decodable>(urlString: String, decodingType: T.Type, completed: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(decodingType, from: data)
                completed(.success(decodedData))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func fetchTopMovies(completed: @escaping (Result<[TopMovies], NetworkError>) -> Void) {
        let urlString = "\(baseURL)/trending/movie/day?api_key=\(NetworkManager.apiKey)&page=1"
        performRequest(urlString: urlString, decodingType: TopMoviesResponse.self) { result in
            switch result {
            case .success(let response):
                completed(.success(response.results))
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    func getNetworkCall<T>(fetchFunction: @escaping (@escaping (Result<T, NetworkError>) -> Void) -> Void, saveData: @escaping (T) -> Void) {
        fetchFunction { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    saveData(data)
                case .failure(let error):
                    print("Failed to fetch data: \(error)")
                }
            }
        }
    }
    
    func fetchDiscoverMovies(completed: @escaping (Result<[DiscoverMovies], NetworkError>) -> Void) {
        let urlString = "\(baseURL)/discover/movie?api_key=\(NetworkManager.apiKey)&page=1"
        performRequest(urlString: urlString, decodingType: DiscoverMoviesResponse.self) { result in
            switch result {
            case .success(let response):
                completed(.success(response.results))
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    func fetchAllTimeMovies(completed: @escaping (Result<[AllTimeMovies], NetworkError>) -> Void) {
        let urlString = "\(baseURL)/movie/top_rated?api_key=\(NetworkManager.apiKey)&page=1"
        performRequest(urlString: urlString, decodingType: AllTimeMoviesResponse.self) { result in
            switch result {
            case .success(let response):
                completed(.success(response.results))
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    func fetchTopSeries(completed: @escaping (Result<[TopSeries], NetworkError>) -> Void) {
        let urlString = "\(baseURL)/trending/tv/day?api_key=\(NetworkManager.apiKey)&page=1"
        performRequest(urlString: urlString, decodingType: TopSeriesResponse.self) { result in
            switch result {
            case .success(let response):
                completed(.success(response.results))
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    func fetchDiscoverSeries(completed: @escaping (Result<[DiscoverSeries], NetworkError>) -> Void) {
        let urlString = "\(baseURL)/discover/tv?api_key=\(NetworkManager.apiKey)&page=1"
        performRequest(urlString: urlString, decodingType: DiscoverSeriesResponse.self) { result in
            switch result {
            case .success(let response):
                completed(.success(response.results))
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
}



