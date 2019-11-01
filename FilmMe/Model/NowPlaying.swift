//
//  NowPlaying.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/24/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct NowPlaying: Codable {
    
    let page: Int?
    let results: [ResultNP]?
   
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
}

// MARK: - Result
struct ResultNP: Codable {
    
    let popularity: Double
    let posterPath: String?
    let title: String?
    let overview, releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        
        case popularity
        case posterPath = "poster_path"
        case title
        case overview
        case releaseDate = "release_date"
    }
}

