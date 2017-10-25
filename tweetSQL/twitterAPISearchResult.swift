//
//  twitterAPISearchResult.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/31/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

class twitterAPISearchResult {
    
    let data: Dictionary<String, Any>
    
    let completed_in: Float?
    let count: Int32?
    let max_id: Int32?
    let since_id: Int32?
    let query: String?
    let refresh_url: URL?
    var statuses: Array<tweetClass>
    
    init (searchResults: Dictionary<String, Any>, tweets: Array<Any>) {
        self.data = searchResults
        
        self.completed_in = searchResults["completed_in"] as? Float
        self.count = searchResults["count"] as? Int32
        self.max_id = searchResults["max_id"] as? Int32
        self.since_id = searchResults["since_id"] as? Int32
        self.query = String(describing:searchResults["query"]!).replacingOccurrences(of: "%23", with:"")
        self.refresh_url = URL.init(string: "https://api.twitter.com/1.1/search/tweets.json" + (String(describing: searchResults["refresh_url"]!)))
        self.statuses = Array()
        for tweet in tweets {
            let newTweet = tweetClass.init(JSONTweet: tweet as! Dictionary<String,Any>)
            self.statuses.append(newTweet)
        }
    }
}
    

