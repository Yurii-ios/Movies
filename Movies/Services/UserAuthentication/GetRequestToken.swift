//
//  GetRequestToken.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import UIKit
import SwiftUI

class GetRequestToken {
    private let apiKey = "c65b87be4c195ac46aae9e7711c2e91c"
    private let getTokenMethod = "authentication/token/new"
    private let baseURLSecureString = "https://api.themoviedb.org/3/"
    
    private var login = LoginWithToken()
    
    func getRequestToken(userName: String, password: String) {
        let urlString = baseURLSecureString + getTokenMethod + "?api_key=" + apiKey
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, downloadError in
            if let error = downloadError {
                print("Could not complete the request \(error)")
            } else {
                let parsedResult = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                if let requestToken = parsedResult["request_token"] as? String {
                    DispatchQueue.main.async() {
                        self.login.loginWithToken(requestToken: requestToken, apiKey: self.apiKey, baseURLSecureString: self.baseURLSecureString, username: userName, password: password)
                    }
                } else {
                    print("Could not find request_token in \(parsedResult)")
                }
            }
        }
        task.resume()
    }
}
