//
//  GetSessionID.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import Foundation
import SwiftUI

class GetSessionID {
    @AppStorage("isOnboarding") var isOnboarding = false
    private let getSessionIdMethod = "authentication/session/new"
    
    func getSessionID(requestToken: String, apiKey: String, baseURLSecureString: String ) {
        let parameters = "?api_key=\(apiKey)&request_token=\(requestToken)"
        let urlString = baseURLSecureString + getSessionIdMethod + parameters
        let url = URL(string: urlString)!
        print(url)
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Could not complete the request \(error)")
            } else {
                let parsedResult = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                if let sessionID = parsedResult["session_id"] as? String {
                    print(sessionID)
                    self.isOnboarding.toggle()
                } else {
                    print("Could not find session_id in \(parsedResult)")
                }
            }
        }
        task.resume()
    }
}
