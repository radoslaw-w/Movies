    //
    //  MovieCell.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 04/05/2023.
    //
import Dependencies
import Kingfisher
import SwiftUI

struct MovieCell: View {
    static let infoHeight:CGFloat = 60
    let movie: Movie

    var body: some View {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0 ) {
                    Group {
                        KFImage(movie.posterPath)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(height: max(geometry.size.height - Self.infoHeight,0))
                            .clipped()
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text(movie.originalTitle)
                            .font(.title3)
                            .lineLimit(1)
                        Text(movie.genres.joined(separator: ", "))
                            .font(.caption)
                            .minimumScaleFactor(0.8)
                            .lineLimit(1)
                    }.padding([.leading,.trailing],10)
                    Spacer()
                }
            }
            .background(.gray)
            .aspectRatio(1, contentMode: .fill)
    }
}

enum CellSize: CGFloat{
    case small = 100
    case medium = 150
    case large = 200
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MovieCell(movie:
                        Movie(id: 0,
                              originalTitle: "Birdman or (The Unexpected Virtue of Innocence)",
                              posterPath: URL(string: "https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
                              genres: ["Drama","Action","Horror","Adventure", "Comedy", "Sitcom", "Biography","Documentary"]
                             )
            )
        }.frame(height: CellSize.large.rawValue)
    }
}
