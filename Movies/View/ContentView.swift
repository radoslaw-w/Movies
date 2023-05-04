//
//  ContentView.swift
//  Movies
//
//  Created by Radoslaw Winkler on 03/05/2023.
//

import Dependencies
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        if viewModel.message != nil {
            Text(viewModel.message!)
        }else{
            List(viewModel.movies, id:\.id){ movie in
                Text(movie.originalTitle)
                Text(movie.genres.joined(separator:", "))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: withDependencies {
            $0.movieAPI = .testValue
        } operation: {
            ContentViewModel()
        })
    }
}
