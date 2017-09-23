//
//  tweet.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/31/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

struct tweetData {
    let created_at: Date
    let favorited: Bool
    let favorite_count: Int
    let id: Int
    let is_quote_status: Bool
    let iso_language_code: String
    let lang: String
    let result_type: String
    let retweeted: Bool
    let retweet_count: Int
    let source: URL
    let text: String
    let truncated: Bool
    let user: String
    
    init(tweet: Dictionary<String, Any>) {
        self.created_at = tweet["created_at"] as! Date
        self.favorited = tweet["favorited"] as! Bool
        self.favorite_count = tweet["favorite_count"] as! Int
        self.id = tweet["id"] as! Int
        self.is_quote_status = tweet["is_quote_status"] as! Bool
        self.iso_language_code = tweet["iso_language_code"] as! String
        self.lang = tweet["lang"] as! String
        self.result_type = tweet["result_type"] as! String
        self.retweeted = tweet["retweeted"] as! Bool
        self.retweet_count = tweet["retweet_count"] as! Int
        self.source = tweet["source"] as! URL
        self.text = tweet["text"] as!String
        self.truncated = tweet["truncated"] as! Bool
        self.user = tweet["user"] as! String
    }
}

class tweet {
    
    let data: Dictionary<String, Any>
    
    init (JSONTweet: Dictionary<String, Any>){
        data = JSONTweet
        
    }
    
}
