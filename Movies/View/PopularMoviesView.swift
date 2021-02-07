//
//  PopularMoviesView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 06/02/2021.
//

import SwiftUI

struct PopularMoviesView: View {
    //MARK: - PROPERTIES
    let movies: [MovieModel]
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    //MARK: - BODY
    var body: some View {
        Group {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridLayout, alignment: .leading, spacing: 5) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: DetailMovieView(movieId: movie.id)) {
                            MovieImageViev(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    }
                } //: LazyVGrid
            } //: SCROLL
        } //:GROUP
    }
}

//MARK: - PREVIEW
struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView(movies: [MovieModel(id: 1, title: "", backdropPath: "", posterPath: "", overview: "", voteAverage: 9.0, original_language: "", voteCount: 9, runtime: 0, releaseDate: "", genres: [], credits: nil, videos: nil)])
    }
}
