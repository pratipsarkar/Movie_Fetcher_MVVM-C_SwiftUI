//
//  Movie.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation
import UIKit

// Decalring as class and not struct since we want to update the image later
class Movie: Identifiable {
    let id: Int
    let title: String
    let overview: String
    var poster: UIImage?
    
    init(id: Int, title: String, overview: String, poster: UIImage? = nil) {
        self.id = id
        self.title = title
        self.overview = overview
        self.poster = poster
    }
}
