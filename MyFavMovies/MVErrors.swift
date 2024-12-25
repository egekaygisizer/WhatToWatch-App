//
//  APErrors.swift
//  MyFavMovies
//
//  Created by Ege Kaygisizer on 23/12/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
