//
//  GenreResponseModel.swift
//  PopCornTime
//
//  Created by MacBook on 10.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation

struct GenreResponseModel: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}
