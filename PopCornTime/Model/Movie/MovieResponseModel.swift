//
//  MovieResponseModel.swift
//  PopCornTime
//
//  Created by MacBook on 22.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//


class MovieResponseModel: Codable {
    
    
    
  
            let results: [Result]
            let totalResults, page, totalPages: Int

            enum CodingKeys: String, CodingKey {
                case results
                case totalResults = "total_results"
                case page
                case totalPages = "total_pages"
            }
        }

        // MARK: - Result
        struct Result: Codable {
            let originalLanguage, originalTitle, posterPath, title: String
            let video: Bool
            let voteAverage, popularity: Double
            let voteCount: Int
            let releaseDate, overview: String
            let adult: Bool
            let backdropPath: String
            let id: Int
            let genreIDS: [Int]

            enum CodingKeys: String, CodingKey {
                case originalLanguage = "original_language"
                case originalTitle = "original_title"
                case posterPath = "poster_path"
                case title, video
                case voteAverage = "vote_average"
                case popularity
                case voteCount = "vote_count"
                case releaseDate = "release_date"
                case overview, adult
                case backdropPath = "backdrop_path"
                case id
                case genreIDS = "genre_ids"
            }
        }
