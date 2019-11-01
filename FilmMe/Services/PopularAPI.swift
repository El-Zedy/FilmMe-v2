//
//  PopularAPI.swift
//  FilmMe
//
//  Created by Muhammad El Zedy on 9/17/19.
//  Copyright © 2019 ZozShark. All rights reserved.
//

import Foundation
import Alamofire

class PopularApi{

    func getPopularMovies(completion: @escaping popularResponseCompletion){
        
        guard let url = URL(string: "\(POPULAR_URL)") else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else{return completion(nil)}
            let jsonDecoder = JSONDecoder()
            
            do{
                let popular = try jsonDecoder.decode(Populars.self, from: data)
                completion(popular)
            }catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
