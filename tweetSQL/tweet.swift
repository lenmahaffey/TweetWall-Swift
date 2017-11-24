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
    let db: SQliteDB
    
    let created_at: String?
    let favorited: Bool?
    let favorite_count: Int?
    let id: Int?
    let lang: String?
    let query: String?
    let result_type: String?
    let retweeted: Bool?
    let retweet_count: Int?
    let source: URL?
    let text: String?
    let truncated: Bool?
    let user: twitterUser?

    
    init (JSONTweet: Dictionary<String, Any>, hastag: String) throws {
        self.data = JSONTweet
        self.db = try SQliteDB.openDB()
        
        self.created_at = JSONTweet["created_at"] as? String
        self.favorited = JSONTweet["favorited"] as? Bool
        self.favorite_count = JSONTweet["favorite_count"] as? Int
        self.id = JSONTweet["id"] as? Int
        self.lang = JSONTweet["lang"] as? String
        self.query = hastag
        self.result_type = JSONTweet["result_type"] as? String
        self.retweeted = JSONTweet["retweeted"] as? Bool
        self.retweet_count = JSONTweet["retweet_count"] as? Int
        self.text = JSONTweet["text"] as? String
        self.truncated = JSONTweet["truncated"] as? Bool
        self.user = twitterUser.init(userJSON: JSONTweet["user"]  as! Dictionary<String,Any>)
        
        let searchText = JSONTweet["source"] as! String
        let regEX = try NSRegularExpression(pattern: "<a.+?href=\"([^\"]+)")
        let result = regEX.matches(in: searchText, range: NSRange(searchText.startIndex..., in: searchText))
        let searchResultText = result.map {
                String(searchText[Range($0.range, in: searchText)!])}
        let linkText = String(describing: searchResultText).replacingOccurrences(of: "[\"<a href=\\\"", with: "").replacingOccurrences(of: "\"]", with: "")
        self.source = URL(string: linkText)
        self.addTweetToDB()
    }

    func addTweetToDB () {
        guard let query = self.query else {
            return
        }
        self.db.createTweetTable(tableName: query)
        
        guard let id = self.id else {
            return
        }
        guard let createTweet = self.db.createTweet(hashtag: query, id: String(id)) else {
            return
        }
        if createTweet.code == 0  {
            if self.created_at == nil {
                self.db.updateTweet(hashtag: query, column: "created_at", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "created_at", value: "\(self.created_at!)", tweet: String(describing: id))
            }
            
            if self.favorited == nil {
                self.db.updateTweet(hashtag: query, column: "favorited", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "favorited", value: "\(self.favorited!)", tweet: String(describing: id))
            }

            if self.favorite_count == nil {
                self.db.updateTweet(hashtag: query, column: "favorite_count", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "favorite_count", value: "\(self.favorite_count!)", tweet: String(describing: id))
            }
            
            if self.lang == nil {
                self.db.updateTweet(hashtag: query, column: "lang", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "lang", value: "\(self.lang!)", tweet: String(describing: id))
            }
            
            if self.result_type == nil {
                self.db.updateTweet(hashtag: query, column: "result_type", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "result_type", value: "\(self.result_type!)", tweet: String(describing: id))
            }
            if self.retweeted == nil {
                self.db.updateTweet(hashtag: query, column: "retweeted", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "retweeted", value: "\(self.retweeted!)", tweet: String(describing: id))
            }
            
            if self.retweet_count == nil {
                self.db.updateTweet(hashtag: query, column: "retweet_count", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "retweet_count", value: "\(self.retweet_count!)", tweet: String(describing: id))
            }
            
            if self.source == nil {
                self.db.updateTweet(hashtag: query, column: "source", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "source", value: "\(self.source!)", tweet: String(describing: id))
            }
            
            if self.text == nil {
                self.db.updateTweet(hashtag: query, column: "text", value: "NULL", tweet: String(describing: id))
            } else {
                let replacementText = self.text!.replacingOccurrences(of: "'", with: "\''")
                self.db.updateTweet(hashtag: query, column: "text", value: replacementText, tweet: String(describing: id))
            }
            
            if self.truncated == nil {
                self.db.updateTweet(hashtag: query, column: "truncated", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "truncated", value: "\(self.truncated!)", tweet: String(describing: id))
            }
            
            if self.user?.id == nil {
                self.db.updateTweet(hashtag: query, column: "user", value: "NULL", tweet: String(describing: id))
            } else {
                self.db.updateTweet(hashtag: query, column: "user", value: "\(self.user!.id!)", tweet: String(describing: id))
            }
        }
    }
}
