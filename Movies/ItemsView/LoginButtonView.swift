//
//  LoginButton.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct LoginButtonView: View {
    //MARK: - Properties
    @AppStorage("username") var username: String?
    @AppStorage("password") var password: String?
  
    //MARK: - Body
    var body: some View {
       
            VStack {
                Button(action: {
                    GetRequestToken().getRequestToken(userName: username!, password: password!)
                }, label: {
                    
                    HStack(spacing: 8) {
                        Text("Login")
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        Capsule().strokeBorder(Color.white, lineWidth: 1.25)
                    )
                })
                //: Button
                // show color texts in dark mode
                .accentColor(.white)
            }//: VSTACK
        }
}

//MARK: - Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        
    }
}

