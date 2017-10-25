//
//  user.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 9/22/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

class twitterUser {
    let data: Dictionary<String, Any>
    
    let contributors_enabled: Bool?
    let created_at: String?
    let description: String?
    let favourites_count: Int?
    let friends_count: Int?
    let follow_request_sent: String?
    let followers_count: Int?
    let geo_enabled: Bool?
    let has_extended_profile: Bool?
    let id: Int32?
    let is_translation_enabled: Bool?
    let is_translator: Bool?
    let lang: String?
    let listed_count: Int?
    let location: String?
    let name: String?
    let protected: Bool?
    let screen_name: String?
    let time_zone: String?
    let translator_type: String?
    let url: URL?
    let verified: Bool?
    
    init (userJSON: Dictionary<String, Any>) {
        self.data = userJSON
        
        self.contributors_enabled = userJSON["contributors_enabled"] as? Bool
        self.created_at = userJSON["created_at"] as? String
        self.description = userJSON["description"] as? String
        self.favourites_count = userJSON["favourites_count"] as? Int
        self.friends_count = userJSON["friends_count"] as? Int
        self.follow_request_sent = userJSON["follow_request_sent"] as? String
        self.followers_count = userJSON["followers_count"] as? Int
        self.geo_enabled = userJSON["geo_enabled"] as? Bool
        self.has_extended_profile = userJSON["has_extended_profile"] as? Bool
        self.id = userJSON["id"] as? Int32
        self.is_translation_enabled = userJSON["is_translation_enabled"] as? Bool
        self.is_translator = userJSON["is_translator"] as? Bool
        self.lang = userJSON["lang"] as? String
        self.listed_count = userJSON["listed_count"] as? Int
        self.location = userJSON["location"] as? String
        self.name = userJSON["name"] as? String
        self.protected = userJSON["protected"] as? Bool
        self.screen_name = userJSON["screen_name"] as? String
        self.time_zone = userJSON["time_zone"] as? String
        self.translator_type = userJSON["translator_type"] as? String
        self.url = URL.init(string: String(describing: userJSON["url"]))
        self.verified = userJSON["verified"] as? Bool
    }
}
