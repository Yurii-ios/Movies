//
//  MovieImageViev.swift
//  Movies
//
//  Created by Yurii Sameliuk on 06/02/2021.
//

import SwiftUI

struct MovieImageViev: View {
    
    //MARK: - PROPERTIES
    let movie: MovieModel
    @ObservedObject var imageLoader = ImageLoader()
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Divider()
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                
            }
            HStack {
                VStack() {
                    Text(movie.title.capitalized)
                        .font(.system(.footnote, design: .monospaced))
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .shadow(radius: 4)
                        .multilineTextAlignment(.center)
    
                } //: VStack
                .padding(.vertical,5)
                .padding(.horizontal,5)
                .frame(width: 175, height: 40)
                .background(Color("ColorBlackTransparentLight"))
                .offset(x: 0, y: 115)
            } //: HSTACK
            
        } //: ZStack
        .frame(width: 175, height: 300)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

//MARK: - PREVIEW
struct MovieImageViev_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageViev(movie: MovieModel.init(id: 0, title: "", backdropPath:"/sUQgwo4oCgNVbpIq7ZtIUhF5hOe.jpg" , posterPath: "", overview: "", voteAverage:9.0, original_language: "", voteCount: 1, runtime: 1, releaseDate: "", genres: nil, credits: nil, videos: nil))
    }
}
