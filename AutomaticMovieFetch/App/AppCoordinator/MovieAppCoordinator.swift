//
//  MovieAppCoordinator.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI
import Combine

enum MovieRoute: Hashable {
    case history
}

@MainActor
class MovieAppCoordinator: ObservableObject, MovieCoordinating {
    @Published var navigationPath = NavigationPath()
    let repository: MovieRepository
    
    init() {
        repository = MovieRepositoryImpl(localDataSource: MovieInMemoryStore(), remoteDataSource: MovieNetworkDataSource())
    }
    
    func didTapOnHistory() {
        navigationPath.append(MovieRoute.history)
    }
}
