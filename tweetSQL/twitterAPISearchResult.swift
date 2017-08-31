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
    
    init (JSONTweet: Dictionary<String, Any>){
        data = JSONTweet
    }
    
}
