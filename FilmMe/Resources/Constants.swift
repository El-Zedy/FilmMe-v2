//
//  Constants.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/17/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import Foundation

let URL_Base = "http://api.themoviedb.org/3/movie/"
let POPULAR_URL = URL_Base + "popular?api_key=e46b442691d7646a5c48a84216f8e8c1&language=en"
let NP_URL = URL_Base + "now_playing?api_key=e46b442691d7646a5c48a84216f8e8c1&language=en"

typealias popularResponseCompletion = (Populars?) -> Void
typealias NowplayingResponseCompletion = (NowPlaying?) -> Void
