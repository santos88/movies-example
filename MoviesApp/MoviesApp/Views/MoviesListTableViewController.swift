//
//  MoviesListTableViewController.swift
//  MoviesApp
//
//  Created by Santos Ramon on 6/3/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit
import AlamofireImage
import SVProgressHUD

protocol MovieCellProtocol: AnyObject {
    func openDetail(movie:MovieModel)
}

class MoviesListTableViewController: UITableViewController, MovieCellProtocol {
    var moviesController = MoviesController()
    var selectedMovie : MovieModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies(type: .topRated)
    }
    
    func loadMovies(type: listType) {
        SVProgressHUD.show()
        moviesController.loadMovies(type: type) { [weak self] (data, error) in
            if (error != nil) {
                SVProgressHUD.show(withStatus: error?.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                self?.tableView.reloadData()
            }
        }
    }

    @IBAction func rankingTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loadMovies(type: .topRated)
        } else {
            loadMovies(type: .popular)
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moviesController.cache.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = moviesController.cache[indexPath.row]
        cell.configure(movie: movie)
        cell.delegate = self
        return cell
    }
    
    func openDetail(movie: MovieModel) {
        selectedMovie = movie;
        self.performSegue(withIdentifier: "goDetail", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail" {
            let vc = segue.destination as! MovieDetailViewController
            vc.movie = selectedMovie
        }
    }

}
