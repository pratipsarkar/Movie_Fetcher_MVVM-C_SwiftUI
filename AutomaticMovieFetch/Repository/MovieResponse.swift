//
//  MovieResponse.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [MovieDTO]
}
