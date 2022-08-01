//
//  MovieFormViewController.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 01/08/22.
//

import UIKit

class MovieFormViewController: UIViewController {

    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldRating: UITextField!
    @IBOutlet weak var textFieldDuration: UITextField!
    @IBOutlet weak var textFieldCategory: UITextField!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            title = "Edit registry"
            textFieldTitle.text = movie.title
            textFieldRating.text = "\(movie.rating!)"
            textFieldDuration.text = movie.duration
            textFieldCategory.text = movie.categories
            textViewSummary.text = movie.summary
            buttonAddEdit.setTitle("Save", for: .normal)
            imageViewPoster.image = UIImage(named: movie.image!)
            imageViewPoster?.contentMode = .scaleAspectFit
            // or imageViewPoster?.contentMode =  UIViewContentMode.scaleAspectFill
            
        }
    }

    @IBAction func selectPoster(_ sender: UIButton) {
    }
    @IBAction func save(_ sender: UIButton) {
    }
}
