//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func detailTapped(_ sender: UIButton) {
        
    }

}
