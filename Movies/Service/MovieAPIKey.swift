//
//  Interface.swift
//  Movies
//
//  Created by Radoslaw Winkler on 03/05/2023.
//

import Dependencies

public enum MovieAPIKey: DependencyKey {
   public static let liveValue = MovieAPI.liveValue
    public static let testValue = MovieAPI.testValue
}

extension DependencyValues {
    public var movieAPI: MovieAPI {
        get { self[MovieAPIKey.self] }
        set { self[MovieAPIKey.self] = newValue }
    }
}
 
