//
//  MovieResults.swift
//  Movies
//
//  Created by Radoslaw Winkler on 03/05/2023.
//

import Foundation

struct MovieResults: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let id: Int
    let originalTitle: String
    let posterPath: String
    let genreIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case posterPath = "poster_path"
    }
}



