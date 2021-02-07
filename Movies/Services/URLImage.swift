//
//  URLImage.swift
//  Movies
//
//  Created by Yurii Sameliuk on 06/02/2021.
//

import SwiftUI

struct URLImage: View {
    
    //MARK: - PROPERTIES
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImagesLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    //MARK: - BODY
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
            
        }
    }
}

//MARK: - PREVIEW
struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://image.tmdb.org/t/p/w500/sUQgwo4oCgNVbpIq7ZtIUhF5hOe.jpg")
            .previewLayout(.sizeThatFits)
            .padding()
}
}
