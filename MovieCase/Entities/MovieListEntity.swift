//
//  MovieListEntity.swift
//  MovieCase
//
//  Created by burhan cem Sezeroglu on 20.08.2023.
//

import Foundation

// MARK: - MovieListEntity

struct MovieListEntity: Codable {
    let search: [Search]?
    let totalResults, response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable {
    let title, year, imdbID: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}
