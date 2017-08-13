//
//  twitterAPI.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

class twitterAPIQuery {
    
    let bearerTokenCredentials: String
    let authToken: String
    
    init (credendtials: String) {
        self.bearerTokenCredentials = "Ou6nKK5jAYErdtHFr1esY5gZF:Cefy7q0H1fvucmaWoro7yZVj2wLjW2Am9JvQCtWzR02Z39l6WE"
    }
    
    func getAuthToken() {
        let authURL = URL(string: "http://api.twitter.com/oauth2/token")
        let bearerTokenCredentialsData = self.bearerTokenCredentials.data(using: .utf8)
        let authString = "Basic \(bearerTokenCredentialsData!.base64EncodedString())"
        var authRequest = URLRequest(url: authURL!)
        authRequest.httpMethod = "POST"
        authRequest.setValue(authString , forHTTPHeaderField: "Authorization" )
        authRequest.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let authBody = "grant_type=client_credentials"
        authRequest.httpBody = authBody.data(using: .utf8)
        let authSession = URLSession(configuration: URLSessionConfiguration.default)
        let authTask = authSession.dataTask(with: authRequest, completionHandler:
        {(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data{
                let JSONdata = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                let token = JSONdata!["access_token"]! as! String
                print(token)
                self.setAuthToken(token: token)
                //getTweets(token: token, hashtag: "#Denver")
            }
        })
        authTask.resume()
    }
    
    func setAuthToken (token: String) {
        let authToken = token
    }
    
    func getTweets (token: String, hashtag: String){
        let apiURLComponents = NSURLComponents.init()
        apiURLComponents.scheme = "https"
        apiURLComponents.host = "api.twitter.com"
        apiURLComponents.path = "/1.1/search/tweets.json"
        apiURLComponents.query = hashtag
        //let apiURL = apiURLComponents.url!
        let apiURL = URL(string: "https://api.twitter.com//1.1/search/tweets.json?q=%23Denver")
        print(apiURL!)
        let apiSessionConfig = URLSessionConfiguration.default
        let apiSession = URLSession(configuration: apiSessionConfig)
        let authToken = "Bearer \(token)"
        var apiRequest = URLRequest(url: (apiURL!))
        apiRequest.httpMethod = "GET"
        apiRequest.setValue(authToken , forHTTPHeaderField: "Authorization" )
        apiRequest.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let apiTask = apiSession.dataTask(with: apiRequest, completionHandler:
        {(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data{
                let JSONdata = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                print(JSONdata!)
                let path = "/users/bozziley/desktop/#denver.json"
                let contents = String(data: data, encoding: String.Encoding.utf8)
                do{
                    try contents?.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
                }
                catch let error as NSError {
                    print(error)
                }
            }
        })
        apiTask.resume()
    }
}
