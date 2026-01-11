//
//  MovieHomeViewModel.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Combine
import Foundation
import SwiftUI

@MainActor
class MovieHomeViewModel: ObservableObject {
    // Changes to these properties will result in update
    @Published var movie: Movie?
    @Published var isActive: Bool
        
    private var repository: MovieRepository
    private var coordinator: MovieCoordinating?
    private var task: Task<Void, Never>?
    
    init(repository: MovieRepository, coordinator: MovieCoordinating) {
        self.repository = repository
        self.coordinator = coordinator
        self.isActive = false
    }
    
    func startFetching() {
        guard isActive == false else { return }
        isActive = true
        task = Task { [weak self] in
            guard let self else { return }
            while !Task.isCancelled {
                do {
                    // Updates state
                    movie = try await repository.fetchRandomMovie()
                    try await Task.sleep(nanoseconds: 10_000_000_000)
                } catch {
                    print("Error encountered while fetching movie: \(error)")
                }
            }
        }
    }
    
    func stopFetching() {
        task?.cancel()
        task = nil
        isActive = false
    }
    
    func didTapOnHistory() {
        coordinator?.didTapOnHistory()
    }
}
