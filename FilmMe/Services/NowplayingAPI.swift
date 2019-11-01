//
//  NowplayingAPI.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/24/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import Foundation
import Alamofire

class NowplayingApi{
    
    
    func getNPMovies(completion: @escaping NowplayingResponseCompletion){
        
        guard let url = URL(string: "\(NP_URL)") else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else{return completion(nil)}
            let jsonDecoder = JSONDecoder()
            
            do{
                let NP = try jsonDecoder.decode(NowPlaying.self, from: data)
                completion(NP)
            }catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
