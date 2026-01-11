//
//  MovieNetworkDataSource.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation
import UIKit

class MovieNetworkDataSource: MovieNetworkFetcher {
    private let apiKey = "d77f0f05c62f652ba456a96152d31cf9"
    private let apiUrl = "https://api.themoviedb.org/3/discover/movie"
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private let urlSession = URLSession.shared
    
    func fetchRandomMovie() async throws -> Movie {
        var urlString = "\(apiUrl)?api_key=\(apiKey)"
        if let page = (1..<10).randomElement() {
            urlString += "&page=\(page)"
        }
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, urlResponse) = try await urlSession.data(from: url)
        guard let httpResponse = urlResponse as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let response = try JSONDecoder().decode(MovieResponse.self, from: data)
        guard let movieDto = response.results.randomElement() else {
            throw URLError(.badServerResponse)
        }
        
        let poster = try await fetchMoviePoster(posterPath: movieDto.poster_path)
        
        let movieEntity = Movie(id: movieDto.id,
                                title: movieDto.title,
                                overview: movieDto.overview,
                                poster: poster)
        
        return movieEntity
    }
    
    func movieStream() -> AsyncThrowingStream<Movie, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    while !Task.isCancelled {
                        let movie = try await fetchRandomMovie()
                        continuation.yield(movie)

                        try await Task.sleep(
                            nanoseconds: 10_000_000_000
                        )
                    }
                } catch {
                    continuation.finish(throwing: error)
                }
            }

            // Called when stream consumer cancels iteration
            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }
    
    private func fetchMoviePoster(posterPath: String?) async throws -> UIImage {
        guard let posterPath else {
            throw URLError(.badURL)
        }
        let urlString = imageBaseUrl + posterPath
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await urlSession.data(from: url)
        guard let uiImage = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        return uiImage
    }
}
