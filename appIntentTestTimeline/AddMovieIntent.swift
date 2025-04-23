//
//  AddMovieIntent.swift
//  appIntentTestTimeline
//
//  Created by Luke O'Sullivan on 17/04/2025.
//
import AppIntents

// 2.
struct AddMovieIntent: AppIntent {
    
    // 3.
    static var title = LocalizedStringResource("Add a new movie")
    
    // 4.
    @Parameter(title: "Movie Title")
    var movieTitle: String
    
    // 5.
    func perform() async throws -> some IntentResult {
        MovieViewModel.shared.addMovie(movieTitle: movieTitle)
        return .result()
    }
}

