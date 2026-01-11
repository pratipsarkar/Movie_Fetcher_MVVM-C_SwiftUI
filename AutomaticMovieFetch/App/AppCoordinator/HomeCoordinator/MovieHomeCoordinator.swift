//
//  MovieHomeCoordinator.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI

class MovieHomeCoordinator {
    var repository: MovieRepository
    var viewModel: MovieHomeViewModel
    
    init(repository: MovieRepository, coordinator: MovieCoordinating) {
        self.repository = repository
        self.viewModel = MovieHomeViewModel(repository: repository, coordinator: coordinator)
    }
    
    func start() -> some View {
        return MovieHomeView(viewModel: self.viewModel)
    }
}
