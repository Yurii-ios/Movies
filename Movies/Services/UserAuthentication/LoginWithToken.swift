//
//  LoginWithToken.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import Foundation

class LoginWithToken {
    
    private let loginMethod = "authentication/token/validate_with_login"
    private var getSessionId = GetSessionID()
    
    func loginWithToken(requestToken: String, apiKey: String, baseURLSecureString: String, username: String, password: String) {
        
        let parameters = "?api_key=\(apiKey)&request_token=\(requestToken)&username=\(username)&password=\(password)"
        let urlString = baseURLSecureString + loginMethod + parameters
        let url = URL(string: urlString)!
        print(url)
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, downloadError in
            if let error = downloadError {
                print("Could not complete the request \(error)")
            } else {
                let parsedResult = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                if let success = parsedResult["success"] as? Bool {
                    print("Login status: \(success)")
                    DispatchQueue.main.async() {
                        print(success)
                        self.getSessionId.getSessionID(requestToken: requestToken, apiKey: apiKey, baseURLSecureString: baseURLSecureString)
                    }
                } else {
                    if let status_code = parsedResult["status_code"] as? Int {
                        DispatchQueue.main.async() {
                            let message = parsedResult["status_message"]
                            print("\(status_code): \(message!)")
                        }
                    } else {
                        DispatchQueue.main.async() {
                        }
                        print("Could not find success in \(parsedResult)")
                    }
                }
            }
        }
        task.resume()
    }
}
