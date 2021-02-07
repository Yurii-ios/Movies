//
//  LoginView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct LoginView: View {
    //MARK: - PROPERTIES
    @AppStorage("username") var username: String = ""
    @AppStorage("password") var passwd: String = ""
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username:")
                .font(.callout)
                .bold()
            TextField("Enter your name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250, height: 20)
                .padding(8)
                .background(
                    Color(.lightGray)
                        .opacity(0.1)
                        .cornerRadius(9.0)
                )
            
            Text("Password:")
                .font(.callout)
                .bold()
            TextField("Enter your Password", text: $passwd)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250, height: 20)
                .padding(8)
                .background(
                    Color(.lightGray)
                        .opacity(0.1)
                        .cornerRadius(9.0)
                )
        }//: VSTACK
    }
}

//MARK: - PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
