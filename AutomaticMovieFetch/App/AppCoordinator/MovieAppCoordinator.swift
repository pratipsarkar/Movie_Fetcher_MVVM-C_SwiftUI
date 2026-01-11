//
//  MovieAppCoordinator.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI

class MovieAppCoordinator: MovieCoordinator, MovieCoordinating {
    private var repository: MovieRepository
    
    init() {
        repository = MovieRepositoryImpl(localDataSource: MovieInMemoryStore(), remoteDataSource: MovieNetworkDataSource())
    }
    
    func start() -> AnyView {
        let homeCoordinator = MovieHomeCoordinator(repository: repository, coordinator: self)
        return AnyView(homeCoordinator.start())
    }
    
    func didTapOnHistory() -> AnyView {
        let historyCoordinator = MovieHistoryCoordinator(repository: repository)
        return AnyView(historyCoordinator.start())
    }
}
