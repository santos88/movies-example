//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    var movie: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTitle.text = movie?.title
        self.movieOverview.text = movie?.overview
        if let posterURL = movie?.posterURL() {
            movieImage.af_setImage(withURL: posterURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
