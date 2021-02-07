//
//  LoadDetailMovieView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 06/02/2021.
//

import SwiftUI

class LoadDetailMovieView: ObservableObject {
    
    private let movieService: MovieService
    @Published var movie: MovieModel?
    @Published var isLoading = false
    @Published var error: NSError?
    
    init(movieService: MovieService = Webservices.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.movieService.fetchMovie(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let movie):
                print(movie)
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
