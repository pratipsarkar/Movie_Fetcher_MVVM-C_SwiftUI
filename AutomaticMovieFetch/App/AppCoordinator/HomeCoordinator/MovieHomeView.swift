//
//  MovieHomeView.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI

struct MovieHomeView: View {
    // Change in state of published properties in view model will result in update
    @StateObject var viewModel: MovieHomeViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                if let movie = viewModel.movie {
                    if let poster = movie.poster {
                        Image(uiImage: poster)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                    }

                    Text(movie.title)
                        .font(.headline)

                    Text(movie.overview)
                        .font(.body)
                }
                
                HStack {
                    Button("Start") { viewModel.startFetching() }
                    Button("Stop") { viewModel.stopFetching() }
                }

                NavigationLink("History") {
                    viewModel.didTapOnHistory()
                }
            }
            .padding()
        }
    }
}
