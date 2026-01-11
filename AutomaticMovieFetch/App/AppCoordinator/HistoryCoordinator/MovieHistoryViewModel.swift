//
//  MovieHistoryViewModel.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Combine
import Foundation

class MovieHistoryViewModel {
    let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func getAllMovies() -> [Movie] {
        return self.repository.allMovies()
    }
}
