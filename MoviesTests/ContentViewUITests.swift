    //
    //  ContentViewUITests.swift
    //  MoviesTests
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //

import Dependencies
import XCTest
@testable import Movies
import SnapshotTesting
import SwiftUI

final class ContentViewUITests: XCTestCase {
    var view:ContentView!

    override func setUp() async throws {
        view = await withDependencies {
            $0.movieAPI = .testValue
        } operation: {
            await MainActor.run{
                ContentView(viewModel: ContentViewModel())
            }
        }
    }


    func testDataFetched() async {
        await view.viewModel.refreshData()
        let viewController = await UIHostingController(rootView: view)
        await MainActor.run {
            assertSnapshot(matching: viewController, as: .image)
        }

    }

    func testDataFetchedError() async {
        await MainActor.run{
            view.viewModel.message = "Error"
        }
        let viewController = await UIHostingController(rootView: view)
        await MainActor.run {
            assertSnapshot(matching: viewController, as: .image)
        }

    }


}
