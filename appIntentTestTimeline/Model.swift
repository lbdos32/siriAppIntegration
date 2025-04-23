//
//  Model.swift
//  appIntentTestTimeline
//
//  Created by Luke O'Sullivan on 17/04/2025.
//
import Foundation
import AppIntents

// 1.
struct MovieItem: Identifiable {
    // 2.
    var id: UUID = UUID()
    var movieTitle: String
    var isWatched: Bool = false
    var rating: MovieRating
}

// 3.
enum MovieRating: String {
    case toWatch
    case bad
    case good
    case incredible
}


extension MovieItem: AppEntity {
    // 2.
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Movie"
    
    // 3.
    var displayRepresentation: DisplayRepresentation {
        .init(title: LocalizedStringResource(stringLiteral: movieTitle))
    }
    
    // 4.
    static var defaultQuery = MovieQuery()
}

// 5.
struct MovieQuery: EntityQuery {
    // 6.
    func entities(for identifiers: [UUID]) async throws -> [MovieItem] {
        MovieViewModel.shared.movies.filter { identifiers.contains($0.id) }
    }
    
    // 7.
    func suggestedEntities() async throws -> [MovieItem] {
        MovieViewModel.shared.movies.filter { !$0.isWatched }
    }
}

extension MovieRating: AppEnum {
    // 2.
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Film Rating"
    
    // 3.
    static var caseDisplayRepresentations: [MovieRating: DisplayRepresentation] = [
        .toWatch: "To watch",
        .bad: "Bad",
        .good: "Good",
        .incredible: "Incredible 💫",
    ]
}
