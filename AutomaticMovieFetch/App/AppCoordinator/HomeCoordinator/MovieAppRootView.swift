//
//  MovieAppRootView.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 12/01/26.
//

import Foundation
import SwiftUI

struct MovieAppRootView: View {

    @StateObject private var coordinator = MovieAppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            MovieHomeCoordinator(
                repository: coordinator.repository,
                coordinator: coordinator
            )
            .start()
            .navigationDestination(for: MovieRoute.self) { route in
                switch route {
                case .history:
                    MovieHistoryCoordinator(
                        repository: coordinator.repository
                    ).start()
                }
            }
        }
    }
}
