//
//  tweet.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/31/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

struct tweetData {
    let source: URL
    let truncated: Bool
    let is_quote_status: Bool
    let iso_language_code: String
    let result_type: String
    let lang: String
    let favorited: Bool
    let favorite_count: Int
    let id: Int
    let retweeted: Bool
    let retweet_count: Int
    let text: String
    let created_at: Date
    let user: NSObject
    let in_reply_to_user_id: NSObject
    let in_reply_to_screen_name: NSObject
}

class tweet {
    
    let data: Dictionary<String, Any>
    
    init (JSONTweet: Dictionary<String, Any>){
        data = JSONTweet
    }
    
}
