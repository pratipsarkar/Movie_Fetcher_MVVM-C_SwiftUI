//
//  MovieRepository.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation

protocol MovieRepository {
    func fetchRandomMovie() async throws -> Movie
    func allMovies() -> [Movie]
}
