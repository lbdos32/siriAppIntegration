import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            // 1.
            List(MovieViewModel.shared.movies) { movie in
                // 2.
                HStack {
                    Image(systemName: movie.isWatched ? "checkmark.circle.fill" : "circle")
                    
                    Text(movie.movieTitle)
                        .strikethrough(movie.isWatched)
                        
                    if movie.isWatched {
                        Text("\\(movie.rating.rawValue)")
                    }
                    Spacer()
                }
            }
            .padding()
            .listStyle(PlainListStyle())
            .navigationTitle("Movie List")
        }
    }
}
