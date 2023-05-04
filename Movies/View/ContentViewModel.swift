    //
    //  ContentViewModel.swift
    //  Movies
    //
    //  Created by Radoslaw Winkler on 03/05/2023.
    //
import Dependencies
import Combine

@MainActor
class ContentViewModel : ObservableObject {
    @Dependency(\.movieAPI) var movieAPI
    @Published public private(set) var message: String?

        //Values in these two properties could be potentially persisted
    @Published public private(set) var movies: [Movie] = []
    private var genres:[Gerne] = [Gerne]()

    init() {
        Task{ [weak self] in
            await self?.refreshData()
        }
    }

    func refreshData() async{
        do {
            self.genres = try await movieAPI.genres().genres
            self.movies = try await movieAPI.movies().results.compactMap { [weak self] in
                guard let self = self else { return nil }
                return Movie.init(result:$0, genres: self.genres)
            }
        }catch{
                //TODO: better error handling
            self.message = "An error occured"
        }

    }

}

