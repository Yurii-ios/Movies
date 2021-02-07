//
//  SettingsRowViews.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct SettingsRowViews: View {
    //MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    //MARK: - BODY
    var body: some View {
        VStack {
           
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(.gray)
                    Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                    
                } else {
                    EmptyView()
                }
            }
        } //: VSTACK
    }
}

//MARK: - PREVIEW
struct SettingsRowViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowViews(name: "Developer", content: "Yurii Sameliuk")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowViews(name: "Website", linkLabel: "The Movie DB", linkDestination: "https://www.themoviedb.org")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
