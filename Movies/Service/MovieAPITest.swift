    //
    //  MovieAPITest.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //

import Dependencies
import Foundation

extension MovieAPI: TestDependencyKey {
    public static let testValue = Self(movies: {
        MovieResults(results:
                        [Result(id: 0, originalTitle: "Batman", posterPath: "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg", genreIDS: [0, 99, 98]),
                         Result(id: 1, originalTitle: "Zorro", posterPath: "/b9UCfDzwiWw7mIFsIQR9ZJUeh7q.jpg", genreIDS: [1,2]),
                         Result(id: 2, originalTitle: "Superman", posterPath: "/b9UCfDzwiWw7mIFsIQR9ZJUeh7q.jpg", genreIDS: [1,2]),
                         Result(id: 3, originalTitle: "Spiderman", posterPath: "/b9UCfDzwiWw7mIFsIQR9ZJUeh7q.jpg", genreIDS: [0,2]),
                        ]
        )
    },genres: {
        GerneResult(genres:
                        [Gerne(id: 0, name: "Drama"),
                         Gerne(id: 1, name: "Action"),
                         Gerne(id: 2, name: "Adventure"),
                        ]
        )
    }
    )
}


