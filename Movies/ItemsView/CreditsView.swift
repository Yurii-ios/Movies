//
//  CreditsView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Text("""
    Copyright © Yurii Sameliuk
    All right reserved
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
        
    }
}

//MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
