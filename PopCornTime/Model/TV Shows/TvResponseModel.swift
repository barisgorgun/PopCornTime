//
//  TvResponseModel.swift
//  PopCornTime
//
//  Created by MacBook on 1.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation
struct TvResponseModel: Codable {
  
    
        let page : Int?
        let totalResults : Int?
        let totalPages: Int?
        let results: [Resultss]

        enum CodingKeys: String, CodingKey {
            case page
            case totalResults = "total_results"
            case totalPages = "total_pages"
            case results
        }
    }

    // MARK: - Result
    struct Resultss: Codable {
        let popularity: Double?
        let voteCount: Int?
        let video: Bool?
        let posterPath: String?
        let id: Int?
        let adult: Bool?
        let backdropPath : String?
        let originalLanguage : String?
        let originalTitle: String?
        let genreIDS: [Int]?
        let title: String?
        let voteAverage: Double?
        let overview, releaseDate: String?
        let name: String?

        enum CodingKeys: String, CodingKey {
            
            case popularity
            case voteCount = "vote_count"
            case video
            case posterPath = "poster_path"
            case id, adult
            case backdropPath = "backdrop_path"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case genreIDS = "genre_ids"
            case title
            case voteAverage = "vote_average"
            case overview
            case releaseDate = "release_date"
            case name
        }
    }

