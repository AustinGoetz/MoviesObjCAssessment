//
//  AMGMovieDetailTableViewCell.swift
//  MovieDBAssessment4
//
//  Created by Austin Goetz on 10/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class AMGMovieDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    func updateViews(movie: AMGMovie) {
        
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(movie.voteAverage)"
        movieOverviewLabel.text = movie.overview
        
    }

}
