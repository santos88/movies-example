//
//  MovieModel.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON

struct MovieModel {
    var title:String?
    var overview:String?
    var poster:String?
    
    init(json:JSON) {
        title = json["title"].string
        overview = json["overview"].string
        poster = json["backdrop_path"].string
    }
    
    func posterURL() -> URL? {
        // we should use an image placeholder here
        let image = poster ?? ""
        let url = URLManager.imageCDN + image
        return URL(string: url)!
    }
}
