//
//  URLManager.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

enum listType {
    case topRated
    case popular
}

class URLManager {
    static let api_key = "34738023d27013e6d1b995443764da44"
    static let base = "https://api.themoviedb.org/3/"
    static let imageCDN = "http://image.tmdb.org/t/p/w500/"
    
    static let popularMovies = base + "movie/popular?api_key=" + api_key
    static let topRatedMovies = base + "movie/top_rated?api_key=" + api_key
    
    static func urlForType(type:listType) -> String{
        var selectedURL = ""
        switch type {
        case .topRated:
            selectedURL = URLManager.topRatedMovies
        case .popular:
            selectedURL = URLManager.popularMovies
        }
        return selectedURL
    }
}
