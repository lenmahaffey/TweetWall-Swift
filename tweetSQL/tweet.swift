//
//  tweet.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/31/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

class tweetClass {
    let data: Dictionary<String, Any>
    
    let created_at: String?
    let favorited: Bool?
    let favorite_count: Int?
    let id: Int?
    let lang: String?
    let result_type: String?
    let retweeted: Bool?
    let retweet_count: Int?
    let source: String?
    let text: String?
    let truncated: Bool?
    let user: twitterUser

    
    init (JSONTweet: Dictionary<String, Any>) {
        self.data = JSONTweet
        
        self.created_at = JSONTweet["created_at"] as? String
        self.favorited = JSONTweet["favorited"] as? Bool
        self.favorite_count = JSONTweet["favorite_count"] as? Int
        self.id = JSONTweet["id"] as? Int
        self.lang = JSONTweet["lang"] as? String
        self.result_type = JSONTweet["result_type"] as? String
        self.retweeted = JSONTweet["retweeted"] as? Bool
        self.retweet_count = JSONTweet["retweet_count"] as? Int
        self.source = JSONTweet["source"] as? String
        self.text = JSONTweet["text"] as? String
        self.truncated = JSONTweet["truncated"] as? Bool
        self.user = twitterUser.init(userJSON: JSONTweet["user"]  as! Dictionary<String,Any>)
    }
 
}
