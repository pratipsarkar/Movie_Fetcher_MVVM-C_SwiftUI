//
//  MovieStore.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation

protocol MovieStore {
    func getAllMovies() -> [Movie]
    func addMovie(_ movie: Movie)
}
