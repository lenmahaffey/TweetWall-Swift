//
//  tweet.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/31/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation


class tweet {
    let data: Dictionary<String, Any>
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
    //let user: String

    
    init (JSONTweet: Dictionary<String, Any>) {
        self.data = JSONTweet
        
        self.created_at = JSONTweet["created_at"] as! Date
        self.favorited = JSONTweet["favorited"] as! Bool
        self.favorite_count = JSONTweet["favorite_count"] as! Int
        self.id = JSONTweet["id"] as! Int
        self.is_quote_status = JSONTweet["is_quote_status"] as! Bool
        self.iso_language_code = JSONTweet["iso_language_code"] as! String
        self.lang = JSONTweet["lang"] as! String
        self.result_type = JSONTweet["result_type"] as! String
        self.retweeted = JSONTweet["retweeted"] as! Bool
        self.retweet_count = JSONTweet["retweet_count"] as! Int
        self.source = JSONTweet["source"] as! URL
        self.text = JSONTweet["text"] as!String
        self.truncated = JSONTweet["truncated"] as! Bool
        //self.user = JSONTweet["user"] as! JSONTweet["created_at"] as! Date
        self.favorited = JSONTweet["favorited"] as! Bool
        self.favorite_count = JSONTweet["favorite_count"] as! Int
        self.id = JSONTweet["id"] as! Int
        self.is_quote_status = JSONTweet["is_quote_status"] as! Bool
        self.iso_language_code = JSONTweet["iso_language_code"] as! String
        self.lang = JSONTweet["lang"] as! String
        self.result_type = JSONTweet["result_type"] as! String
        self.retweeted = JSONTweet["retweeted"] as! Bool
        self.retweet_count = JSONTweet["retweet_count"] as! Int
        self.source = JSONTweet["source"] as! URL
        self.text = JSONTweet["text"] as!String
        self.truncated = JSONTweet["truncated"] as! Bool
        self.user = JSONTweet["user"] as! String
    }
    
}
