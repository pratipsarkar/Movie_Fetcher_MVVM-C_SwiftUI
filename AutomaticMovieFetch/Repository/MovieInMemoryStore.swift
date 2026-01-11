//
//  MovieInMemoryStore.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Combine
import Foundation
import UIKit

class MovieInMemoryStore: MovieStore, ObservableObject {
    private var movies: [Movie] = []
    
    func getAllMovies() -> [Movie] {
        print("getAllMovies \(movies.count)")
        return movies
    }
    
    func addMovie(_ movie: Movie) {
        if movies.filter({$0.id == movie.id}).isEmpty {
            movies.append(movie)
        } else {
            print("movieExists so skipping")
        }
        print("addMovie \(movies.count)")
    }
    
    func updateImage(_ id: Int, poster: UIImage) {
        movies.first(where: { $0.id == id })?.poster = poster
    }
}
