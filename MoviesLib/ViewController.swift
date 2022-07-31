//
//  ViewController.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 28/07/22.
//

import UIKit

class ViewController: UIViewController {
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    func loadMovies() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            movies = try JSONDecoder().decode([Movie].self, from: data)
            for movie in movies {
                print(movie.title)
            }
        } catch {
            print(error)
        }
    }

}

