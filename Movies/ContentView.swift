//
//  ContentView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct ContentView: View {

    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Spacer()
            Text("THE MOVIE DB")
                .fontWeight(.heavy)
                .font(.largeTitle)
                Spacer()
           
            VStack {
                LoginView()
                    .padding(10)
                Spacer()
                HStack(alignment:.center) {
                    LoginButtonView()
                }

            } //: VSTACK
            Spacer()
            CreditsView()
        
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
