//
//  MovieHistoryCoordinator.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI

class MovieHistoryCoordinator {
    var repository: MovieRepository
    var viewModel: MovieHistoryViewModel
    
    init(repository: MovieRepository) {
        self.repository = repository
        self.viewModel = MovieHistoryViewModel(repository: repository)
    }
    
    func start() -> some View {
        return MovieHistoryView(viewModel: self.viewModel)
    }
}
