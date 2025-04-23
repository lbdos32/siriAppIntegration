//
//  MovieRatingIntent.swift
//  appIntentTestTimeline
//
//  Created by Luke O'Sullivan on 17/04/2025.
//


import AppIntents
import SwiftUI

// 1.
struct MovieRatingIntent: AppIntent {
    // 2.
    @Parameter(title: "Select a Movie")
    var movie: MovieItem
    // 3.
    @Parameter(title: "Film Rating")
    var movieRating: MovieRating
    
    static var title = LocalizedStringResource("Add a rating")
    
    // 4.
     func perform() async throws -> some IntentResult  {
         MovieViewModel.shared.addRating(movie: movie, rating: movieRating)
         return .result()
    }
}