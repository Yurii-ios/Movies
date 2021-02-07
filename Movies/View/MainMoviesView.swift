//
//  MainMoviesView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct MainMoviesView: View {
    
    //MARK: - PROPERTIES
    @State private var isShowingSettings: Bool = false
    @ObservedObject private var popularState = LoadMovieList()
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
                VStack(alignment:.center, spacing: 0) {
                    if let popularState = self.popularState.movies {
                        
                        PopularMoviesView(movies: popularState)
                    }
                    
                } //: VSTACK
                .navigationTitle(Text("Popular Movies"))
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            isShowingSettings = true
                        }) {
                            Image(systemName: "slider.horizontal.3")
                        } //: BUTTON
                        .sheet(isPresented: $isShowingSettings) {
                            SettingsView()
                        }
                )
            
        }//: NAVIGATION
        // ----fix problem with NAV constraints----
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear {
            self.popularState.loadMovies(with: .popular)
        }
    }
}

//MARK: - PREVIEW
struct MainMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMoviesView()
    }
}
