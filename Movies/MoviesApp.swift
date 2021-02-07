//
//  MoviesApp.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

@main
struct MoviesApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                MainMoviesView()
            } else {
                ContentView()
            }
        }
    }
}
