//
//  Movies.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 31/07/22.
//

import Foundation

struct Movie: Codable {
    var title: String?
    var categories: String?
    var duration: String?
    var rating: Double?
    var summary: String?
    var image: String?
    
    var imageSmall: String {
        image != "" ? "\(image!)small" : ""
    }
}
