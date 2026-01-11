//
//  MovieDTO.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import Foundation

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
}
