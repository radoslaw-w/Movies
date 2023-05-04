    //
    //  MoviesTests.swift
    //  MoviesTests
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //

import Dependencies
import XCTest
@testable import Movies

final class ContentViewModelTests: XCTestCase {
    var model:ContentViewModel!

    override func setUp() async throws {
        model = await withDependencies {
            $0.movieAPI = .testValue
        } operation: {
            await MainActor.run{
                ContentViewModel()
            }
        }
    }


    func testRefreshDataFiltersOutMissingGenres() async {
        await model.refreshData()
        let movies = await model.movies
        XCTAssertEqual(movies.filter{ $0.id == 0 }.first!.genres.count, 1)
    }


}
