//
//  MovieRepositoryImpl.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    private var localDataSource: MovieStore
    private var remoteDataSource: MovieNetworkFetcher
    
    init(localDataSource: MovieStore, remoteDataSource: MovieNetworkFetcher) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func movieStream() -> AsyncThrowingStream<Movie, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    for try await movie in remoteDataSource.movieStream() {
                        localDataSource.addMovie(movie)
                        continuation.yield(movie)
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }

            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }
    
    func fetchRandomMovie() async throws -> Movie {
        let movie = try await remoteDataSource.fetchRandomMovie()
        localDataSource.addMovie(movie)
        return movie
    }
    
    func allMovies() -> [Movie] {
        return localDataSource.getAllMovies()
    }
}
