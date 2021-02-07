//
//  ImageLoader.swift
//  Movies
//
//  Created by Yurii Sameliuk on 06/02/2021.
//

import SwiftUI

class ImagesLoader: ObservableObject {
   
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data , _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
