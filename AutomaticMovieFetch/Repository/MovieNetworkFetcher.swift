//
//  NetworkDispatcher.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation

protocol MovieNetworkFetcher {
    func fetchRandomMovie() async throws -> Movie
}
