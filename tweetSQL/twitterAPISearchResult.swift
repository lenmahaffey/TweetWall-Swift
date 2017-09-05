//
//  twitterAPISearchResult.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/31/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

struct searchResultsMetadata {
    let completed_in: Float?
    let count: Int32?
    let max_id: Int32?
    let since_id: Int32?
    let query: String?
    let refresh_url: URL?

    
    init (metaData: Dictionary<String, Any>) {
        self.completed_in = metaData["completed_in"] as? Float
        self.count = metaData["count"] as? Int32
        self.max_id = metaData["max_id"] as? Int32
        self.since_id = metaData["since_id"] as? Int32
        self.query = metaData["query"] as? String
        self.refresh_url = URL.init(string: "https://api.twitter.com/1.1/search/tweets.json\(String(describing: metaData["refresh_url"]))")!
    }
}

class twitterAPISearchResult {
    
    let data: Dictionary<String, Any>
    let results: searchResultsMetadata
    private let db: SQliteDB
    
    init (searchResults: Dictionary<String, Any>) throws {
        self.data = searchResults
        self.db = try SQliteDB.openDB()
        self.results = searchResultsMetadata(metaData: self.data)
        }
}
    

