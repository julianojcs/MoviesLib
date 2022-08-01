//
//  MovieViewController.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 28/07/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieFormViewController = segue.destination as? MovieFormViewController {
            movieFormViewController.movie = movie
        }
    }
    
    func prepareScreen() {
        if let movie = movie {
            imageViewPoster.image = UIImage(named: movie.image!)
            labelTitle.text = movie.title
            labelRating.text = "⭐️ \(movie.rating!)"
            labelDuration.text = movie.duration
            labelCategory.text = movie.categories
            textViewSummary.text = movie.summary
        }
    }
}

