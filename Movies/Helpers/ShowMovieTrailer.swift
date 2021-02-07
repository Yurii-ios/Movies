//
//  ShowMovieTrailer.swift
//  Movies
//
//  Created by Yurii Sameliuk on 07/02/2021.
//

import SafariServices
import SwiftUI

struct ShowMovieTrailer: UIViewControllerRepresentable {
    
    let url: URL

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
  
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
