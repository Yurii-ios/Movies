//
//  DetailMovieView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct DetailMovieView: View {
    
    //MARK: - PROPERTIES
    let movieId: Int
    let imageLoader = ImageLoader()
    @ObservedObject private var movieDetailState = LoadDetailMovieView()
    @State var isOverviewExpanded: Bool = false
    @AppStorage("isOnTrailer") var isOnTrailer: Bool = false
    @State private var selectedTrailer: MovieVideo?
    
    //MARK: - BODY
    var body: some View {
        List {
            ZStack {
                if let backdropURL = movieDetailState.movie?.backdropURL {
                    
                    VStack {
                        MovieDetailImage(imageLoader: imageLoader, imageURL: backdropURL)
                    }
                    
                    HStack {
                        if let trailer = movieDetailState.movie?.youtubeTrailers {
                            
                            ForEach(trailer.prefix(1)) { trailer in
                                
                                Image(systemName: "play.circle.fill").resizable()
                                    .foregroundColor(.red)
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 4)
                                    .offset(x: 130, y: 93)
                                    .onTapGesture {
                                        self.selectedTrailer = trailer
                                }
                            }
                        }
                    }
                }
            }
            //MARK: - 1 SECTION
            VStack(alignment: .leading) {
                HStack() {
                    Text(movieDetailState.movie?.ratingText ?? "")
                        .foregroundColor(.yellow)
                    Text(movieDetailState.movie?.scoreText ?? "")
                }
                Spacer()
                HStack() {
                    Text("Duration:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text(movieDetailState.movie?.durationText ?? "")
                }
                Divider()
                HStack {
                    Text("Genre:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text(movieDetailState.movie?.genreText ?? "")
                    
                }
                Divider()
                HStack {
                    Text("Language:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text(movieDetailState.movie?.original_language ?? "English")
                }
                Spacer()
            } //: HSTACK
            
            //MARK: - 2 SECTION
            VStack {
                Text("Overview")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(movieDetailState.movie?.overview ?? "")
                    .lineLimit(self.isOverviewExpanded ? nil : 1)
                    .onTapGesture {
                        withAnimation {
                            self.isOverviewExpanded.toggle()
                        }
                    }
                Button(action: {
                    withAnimation {
                        self.isOverviewExpanded.toggle()
                    }
                }, label: {
                    Text(self.isOverviewExpanded ? "Less" : "Read more")
                        .lineLimit(1)
                        .foregroundColor(.red)
                    
                })
                .padding(.leading, 200)
            } //: VSTACK
            
            //MARK: - 3 SECTION
            HStack(alignment: .top, spacing: 4) {
                if let movie = movieDetailState.movie {
                    if movie.cast != nil && movie.cast!.count > 0 {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Starring:").font(.title3).bold()
                            ForEach(movie.cast!.prefix(12)) { cast in
                                Text(cast.name)
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    if let directors = movieDetailState.movie?.directors {
                        Text("Director(s):").font(.title3).bold()
                        ForEach(directors.prefix(3)) { crew in
                            Text(crew.name)
                        }
                    }
                    Divider()
                    if let producers = movieDetailState.movie?.producers{
                        Text("Producer(s)").font(.title3).bold()
                            .padding(.top)
                        ForEach(producers.prefix(3)) { crew in
                            Text(crew.name)
                        }
                    }
                    Divider()
                    if let screenWriters = movieDetailState.movie?.screenWriters {
                        Text("Screenwriter(s):").font(.title3).bold()
                            .padding(.top)
                        ForEach(screenWriters.prefix(4)) { crew in
                            Text(crew.name)
                        }
                    }
                } //: VSTACK
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            } //: HSTACK
        } //: LIST
        .navigationTitle(movieDetailState.movie?.title ?? "")
        .navigationBarItems(trailing: Button(action: {}, label: {
            Image(systemName: "square.and.arrow.up")
        }))
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            ShowMovieTrailer(url: trailer.youtubeURL!)
        }
    }
}

//MARK: - PREVIEW
struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movieId: 464052)
    }
}
// test
//movie: MovieModel(id: 464052, title: "Чудо-женщина: 1984", backdropPath: "/srYya1ZlI97Au4jUYAktDe3avyA.jpg", posterPath: "/svZDsN6KXh0luyye3m004lkG9qE.jpg", overview: "Влиятельный бизнесмен Максвелл Лорд ищет магические артефакты, которые помогли бы ему обрести силу и могущество подобно богу. Однажды он встречает археолога Барбару Энн Минерву и просит у неё помощи в достижении его цели. Их отношения портятся, когда один из артефактов превращает Минерву в Гепарду, вне себя от ярости она желает ему отомстить за то, что с ней случилось. Лорд просит защиты у Дианы Принс, взамен он обещает, что воскресит Стива Тревора с помощью одного из артефактов.", voteAverage: 7, original_language: "English", voteCount: 3371, runtime: 151, releaseDate: "2020-12-16", genres: [], credits: nil, videos: nil)
