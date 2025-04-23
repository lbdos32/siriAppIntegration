import AppIntents

struct MovieAppShortcutProvider: AppShortcutsProvider {
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AddMovieIntent(),
            phrases: [
                "Change the flight time with ${applicationName}", "Update the flight with ${applicationName}", 
            ],
            shortTitle: "Update Flight",
            systemImageName: "popcorn.circle"
        )

        AppShortcut(
            intent: MovieRatingIntent(),
            phrases: [
                "Add rating to movies using ${applicationName}"
            ],
            shortTitle: "Add rating",
            systemImageName: "star.circle"
        )
    }
}
