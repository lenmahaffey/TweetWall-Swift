//
//  twitterAPI.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

class twitterAPI {
    let bearerTokenCredentials = "Ou6nKK5jAYErdtHFr1esY5gZF:Cefy7q0H1fvucmaWoro7yZVj2wLjW2Am9JvQCtWzR02Z39l6WE"
    let authString: String?
    
    init () {
        let bearerTokenCredentialsData = self.bearerTokenCredentials.data(using: .utf8)
        authString = "Basic \(bearerTokenCredentialsData!.base64EncodedString())"
    }
    
    func getAuthToken() {
        let authURL = URL(string: "http://api.twitter.com/oauth2/token")
        let authSession = URLSession(configuration: URLSessionConfiguration.default)
        var authRequest = URLRequest(url: authURL!)
        authRequest.httpMethod = "POST"
        authRequest.setValue(authString , forHTTPHeaderField: "Authorization" )
        authRequest.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let authBody = "grant_type=client_credentials"
        authRequest.httpBody = authBody.data(using: .utf8)
        let authTask = authSession.dataTask(with: authRequest, completionHandler:
        {(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data{
                let JSONdata = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                let token = JSONdata!["access_token"]! as! String
                print(token)
                //getTweets(token: token, hashtag: "#Denver")
            }
        })
        authTask.resume()

    }
//
    
    /*
    }*/

}
