    //
    //  Carousel.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 04/05/2023.
    //
import Dependencies
import SwiftUI
import Kingfisher


struct Carousel: View {
    var movies: [Movie]
    let size: CellSize
    
    var body: some View {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(size.rawValue))], spacing: 10) {
                    ForEach(movies, id: \.id) { movie in
                        MovieCell(movie: movie)
                    }
                }
            }
        }
}


struct Carousel_Previews: PreviewProvider {
    static let model = withDependencies {
        $0.movieAPI = .testValue
    } operation: {
        ContentViewModel()
    }
    static var previews: some View {
        VStack{
            Carousel(movies: model.movies, size: .small)
            Carousel(movies: model.movies, size: .medium)
            Carousel(movies: model.movies, size: .large) 
        }
    }
}
