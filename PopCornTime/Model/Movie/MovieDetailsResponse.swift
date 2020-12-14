//
//  MovieDetailsResponse.swift
//  PopCornTime
//
//  Created by MacBook on 29.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//


import Foundation

// MARK: - MovieDetailsResponse
struct MovieDetailsResponse: Codable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let homepage: String?
    let id: Int?
    let imdbID :String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget,homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


