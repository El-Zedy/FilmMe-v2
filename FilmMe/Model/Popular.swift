////
////  Popular.swift
////  FilmMe
////
////  Created by Muhammad El Zedy on 9/3/19.
////  Copyright © 2019 ZozShark. All rights reserved.
////
import Foundation

// MARK: - Populars
struct Populars: Codable {
    
    let page: Int?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
}

// MARK: - Result
struct Result: Codable {

    let title: String?
    let popularity: Double
    let posterPath: String?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case posterPath = "poster_path"
        case title
        case overview
        case releaseDate = "release_date"
    }
}
