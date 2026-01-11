//
//  MovieHistoryView.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 11/01/26.
//

import Foundation
import SwiftUI

struct MovieHistoryView: View {
    var viewModel: MovieHistoryViewModel

    var body: some View {
        List(viewModel.getAllMovies()) { movie in
            HStack {
                if let poster = movie.poster {
                    Image(uiImage: poster)
                        .resizable()
                        .frame(width: 60, height: 90)
                }
                VStack(alignment: .leading) {
                    Text(movie.title).bold()
                    Text(movie.overview)
                        .lineLimit(2)
                }
            }
        }
    }
}
