//
//  ViewModel.swift
//  appIntentTestTimeline
//
//  Created by Luke O'Sullivan on 17/04/2025.
//

import Foundation

// 1.
@Observable
class MovieViewModel {
    // 2.
    static let shared = MovieViewModel()
    // 3.
    var movies: [MovieItem] = []
    
    // 4.
    func addMovie(movieTitle: String) {
        let newMovie = MovieItem(movieTitle: movieTitle, rating: .toWatch)
        MovieViewModel.shared.movies.append(newMovie)
    }
    
    // 5.
    func addRating(movie: MovieItem, rating : MovieRating) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            MovieViewModel.shared.movies[index].isWatched.toggle()
            MovieViewModel.shared.movies[index].rating = rating
        }
    }
}
