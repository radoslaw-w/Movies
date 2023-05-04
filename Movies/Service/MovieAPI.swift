    //
    //  MovieAPI.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //

import Foundation

enum ServiceError: Error{
    case loadData
    case parse
}

public struct MovieAPI {
    static let v4apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTAyOTRhNDgxZTlkOWU1NDZiMWIxNDZjMjM4YjUyYyIsInN1YiI6IjY0NTFmZTg3MzNhZDhmMDE3MjhkNDc5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2U0P8eNf9KvQqBeRX5IJ__4ZU5xEBRPJIorQ4zRn4GU"

    static let session = {
        var sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = [
            "Authorization": "Bearer \(v4apiKey)"
        ]
        return URLSession(configuration:sessionConfiguration)
    }()

    public static let baseURL = URL(string: "https://api.themoviedb.org")!
    //App could be firther optimized to fetch accurate size for movie posters
    public static let imageBaseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
    init(movies: @escaping () async throws -> MovieResults,
         genres: @escaping () async throws -> GerneResult){
        self.movies = movies
        self.genres = genres
    }
    var movies: () async throws -> MovieResults
    var genres: () async throws -> GerneResult
}

