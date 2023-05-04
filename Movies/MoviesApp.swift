//
//  MoviesApp.swift
//  Movies
//
//  Created by Radoslaw Winkler on 03/05/2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
