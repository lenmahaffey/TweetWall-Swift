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
    
    let contributors_enabled: Bool
    let created_at: Date
    let default_profile: String
    let default_profile_image: String
    let description: String
    let favourites_count: Int
    let friends_count: Int
    let follow_request_sent: String
    let followers_count: Int
    let following: String
    let geo_enabled: Bool
    let has_extended_profile: Bool
    let id: Int32
    let is_translation_enabled: Bool
    let is_translator: Bool
    let lang: String
    let listed_count: Int
    let location: String
    let name: String
    let notifications: String
    let profile_background_color: RGBColor
    let profile_banner_url: URL
    let profile_image_url: URL
    let profile_text_color: RGBColor
    let profile_background_tile: Bool
    let profile_use_background_image: Bool
    let profile_background_image_url: URL
    let profile_background_image_url_https: URL
    let profile_image_url_https: URL
    let profile_link_color: RGBColor
    let profile_sidebar_fill_color: RGBColor
    let profile_sidebar_border_color: RGBColor
    let protected: Bool
    let screen_name: String
    let statuses_count: String
    let time_zone: TimeZone
    let translator_type: String
    let url: URL
    let utc_offset: String
    let verified: Bool
    
    init (userData: Dictionary<String, Any>) {
        self.data = userData
        
        self.contributors_enabled = userData["contributors_enabled"] as! Bool
        self.created_at = userData["created_at"] as! Date
        self.default_profile = userData["default_profile"] as! String
        self.default_profile_image = userData["default_profile_image"] as! String
        self.description = userData["description"] as! String
        self.favourites_count = userData["favourites_count"] as! Int
        self.friends_count = userData["friends_count"] as! Int
        self.follow_request_sent = userData["follow_request_sent"] as! String
        self.followers_count = userData["followers_count"] as! Int
        self.following = userData["following"] as! String
        self.geo_enabled = userData["geo_enabled"] as! Bool
        self.has_extended_profile = userData["has_extended_profile"] as! Bool
        self.id = userData["id"] as! Int32
        self.is_translation_enabled = userData["is_translation_enabled"] as! Bool
        self.is_translator = userData["is_translator"] as! Bool
        self.lang = userData["lang"] as! String
        self.listed_count = userData["listed_count"] as! Int
        self.location = userData["location"] as! String
        self.name = userData["name"] as! String
        self.notifications = userData["notifications"] as! String
        self.profile_background_color = userData["profile_background_color"] as! RGBColor
        self.profile_banner_url = userData["profile_banner_url"] as! URL
        self.profile_image_url = userData["profile_image_url"] as! URL
        self.profile_text_color = userData["profile_text_color"] as! RGBColor
        self.profile_background_tile = userData["profile_background_tile"] as! Bool
        self.profile_use_background_image = userData["profile_use_background_image"] as! Bool
        self.profile_background_image_url = userData["profile_background_image_url"] as! URL
        self.profile_background_image_url_https = userData["profile_background_image_url_https"] as! URL
        self.profile_image_url_https = userData["profile_image_url_https"] as! URL
        self.profile_link_color = userData["profile_link_color"] as! RGBColor
        self.profile_sidebar_fill_color = userData["profile_sidebar_fill_color"] as! RGBColor
        self.profile_sidebar_border_color = userData["profile_sidebar_border_color"] as! RGBColor
        self.protected = userData["protected"] as! Bool
        self.screen_name = userData["screen_name"] as! String
        self.statuses_count = userData["statuses_count"] as! String
        self.time_zone = userData["time_zone"] as! TimeZone
        self.translator_type = userData["translator_type"] as! String
        self.url = userData["url"] as! URL
        self.utc_offset = userData["utc_offset"] as! String
        self.verified = userData["verified≈"] as! Bool
    }
}
