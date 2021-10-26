//
//  Movie.swift
//  Movie
//
//  Created by Nika Topuria on 20.10.21.
//

import Foundation

struct Movie: Codable {
    var listImage: String?
    var id: Int
    var genreIDs: [Int]
    var movieTitle: String
    var overview: String
    var largeImage: String?
    var score: Double
    
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case genreIDs = "genre_ids"
        case listImage = "backdrop_path"
        case movieTitle = "title"
        case largeImage = "poster_path"
        case score = "vote_average"
    }
}
 
