    //
    //  Movie.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //

import Foundation

struct Movie {
    let id: Int
    let originalTitle: String
    let posterPath: URL
    let genres: [String]
}

extension Movie {
    public init(result: Result, genres allgenres:[Gerne]){
        id = result.id
        originalTitle = result.originalTitle
        posterPath = MovieAPI.imageBaseURL.appending(path: result.posterPath)
            //Skipping non existent genres
        genres = result.genreIDS.compactMap{ gerneId in allgenres.filter { $0.id == gerneId }.first?.name }
    }
}

