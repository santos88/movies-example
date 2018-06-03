//
//  MoviesListController.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MoviesController {
    var cache = [MovieModel]()
    
    func loadMovies(type:listType, completion: @escaping ([MovieModel]?, Error?) -> Void) {
        let url = URLManager.urlForType(type: type)
        Alamofire.request(url).responseJSON { [weak self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let items = self?.processJSONMovies(json: json) {
                    self?.cache = items
                    completion(items, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func processJSONMovies(json:JSON) -> [MovieModel] {
        var items = [MovieModel]()
        for (_, JSON) in json {
            let item = MovieModel(json: JSON)
            items.append(item)
        }
        return items
    }

}
