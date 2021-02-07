//
//  SettingsLabelView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct SettingsLabelView: View {
    //MARK: - PROPERTIES
    var labelText: String
    var labelImage: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
    Spacer()
    Image(systemName: labelImage)
        } //: HSTACK
    }
}

//MARK: - PREVIEW
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "The Movie DB", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
