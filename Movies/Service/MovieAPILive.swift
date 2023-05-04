    //
    //  Interface.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //

import Foundation

extension MovieAPI {
    public static let liveValue = Self(movies: {
        var data:Data
        do {
            (data, _) = try await Self.session.data(from: Self.baseURL.appending(path: "/3/discover/movie"))
        }catch{
            throw ServiceError.loadData
        }
        
        do{
            return try JSONDecoder().decode(MovieResults.self, from: data)
        }catch{
            throw ServiceError.parse
        }
    },genres: {
        var data:Data
        do {
            (data, _) = try await Self.session.data(from: Self.baseURL.appending(path: "/3/genre/movie/list"))
        }catch{
            throw ServiceError.loadData
        }
 
        do{
            return try JSONDecoder().decode(GerneResult.self, from: data)
        }catch{
            throw ServiceError.parse
        }
    }
    )
}



