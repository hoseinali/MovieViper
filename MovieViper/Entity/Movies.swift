//
//  Movies.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let results: [Result]
    let page, totalResults: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct Result: Codable {
    let video: Bool
    let posterPath: String
    let id: Int
    let backdropPath: String?
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case video
        case posterPath = "poster_path"
        case id
        case backdropPath = "backdrop_path"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
