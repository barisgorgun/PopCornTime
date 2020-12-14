

import Foundation

// MARK: - CastResponseModel
struct CastResponseModel: Codable {
    let cast: [Cast]?
    let id: Int?
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let name, originalName: String?
    let popularity: Double?
    let profilePath, character, creditID: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character
        case creditID = "credit_id"
        case order
    }
}

