//
//  MovieHomeCoordinator.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI

class MovieHomeCoordinator {
    private var repository: MovieRepository
    private var coordinator: MovieCoordinating
    
    init(repository: MovieRepository, coordinator: MovieCoordinating) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func start() -> some View {
        let viewModel = MovieHomeViewModel(repository: repository, coordinator: coordinator)
        return MovieHomeView(viewModel: viewModel)
    }
}
