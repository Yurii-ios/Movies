//
//  LoadMovieList.swift
//  Movies
//
//  Created by Yurii Sameliuk on 06/02/2021.
//

import UIKit

class LoadMovieList: ObservableObject {
    @Published var movies: [MovieModel]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    init(movieService: Webservices = Webservices.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.isLoading = true
        self.movieService.fetchMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                print(response)
                self.movies = response.results
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
