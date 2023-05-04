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
                        [Result(id: 0, originalTitle: "Birdman or (The Unexpected Virtue of Innocence)", posterPath: "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg", genreIDS: [0, 99, 98]),
                         Result(id: 1, originalTitle: "Zorro", posterPath: "/b9UCfDzwiWw7mIFsIQR9ZJUeh7q.jpg", genreIDS: [0,1,2,3,4,5]),
                         Result(id: 2, originalTitle: "The Assassination of Jesse James by the Coward Robert Ford", posterPath: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg", genreIDS: [1,2]),
                         Result(id: 3, originalTitle: "Spiderman", posterPath: "/uDsvma9dAwnDPVuCFi99YpWvBk0.jpg", genreIDS: [0,2]),
                        ]
        )
    },genres: {
        GerneResult(genres:
                        [Gerne(id: 0, name: "Drama"),
                         Gerne(id: 1, name: "Action"),
                         Gerne(id: 2, name: "Adventure"),
                         Gerne(id: 3, name: "Animation"),
                         Gerne(id: 4, name: "Horror"),
                         Gerne(id: 5, name: "comedy"),
                        ]
        )
    }
    )
}


