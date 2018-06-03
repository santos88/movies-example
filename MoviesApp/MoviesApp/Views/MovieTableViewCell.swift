//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
    
    weak var delegate: MovieCellProtocol?
    var movie: MovieModel?
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    func configure(movie:MovieModel) {
        self.movie = movie
        self.movieTitle.text = movie.title
        if let posterURL = movie.posterURL() {
            movieImage.af_setImage(withURL: posterURL)
        }
    }
    
    override func prepareForReuse() {
        movieImage.image = nil
        movieTitle.text = nil
    }
    
    @IBAction func detailTapped(_ sender: UIButton) {
        delegate?.openDetail(movie: movie!)
    }

}
