//
//  main.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

var currentSearch = twitterAPI()
sleep(2)
currentSearch.getTweets(hashtag: "#Denver")
sleep(2)

/*
print(currentSearch.currentResult?.db.resultString)
print("-----Search Data-----", "\n")
print("completed_in : ", currentSearch.currentResult?.completed_in, "\n")
print("count : ", currentSearch.currentResult?.count, "\n")
print("max_id : ", currentSearch.currentResult?.max_id, "\n")
print("quert : ", currentSearch.currentResult?.query, "\n")
print("refresh_url : ", currentSearch.currentResult?.refresh_url, "\n")
print("since_id : ", currentSearch.currentResult?.since_id, "\n")
print("-----Tweet Data-----", "\n")
print("created_at : ", currentSearch.currentResult?.statuses[0].created_at, "\n")
print("favorited : ", currentSearch.currentResult?.statuses[0].favorited, "\n")
print("favorite_count : ", currentSearch.currentResult?.statuses[0].favorite_count, "\n")
print("id : ", currentSearch.currentResult?.statuses[0].id, "\n")
print("lang : ", currentSearch.currentResult?.statuses[0].lang, "\n")
print("result_type : ", currentSearch.currentResult?.statuses[0].result_type, "\n")
print("retweet_count : ", currentSearch.currentResult?.statuses[0].retweet_count, "\n")
print("source : ", currentSearch.currentResult?.statuses[0].source, "\n")
print("text : ", currentSearch.currentResult?.statuses[0].text, "\n")
print("truncated : ", currentSearch.currentResult?.statuses[0].truncated, "\n")
print("-----User Data-----", "\n")
print("contributors_enabled : ", currentSearch.currentResult?.statuses[0].user!.contributors_enabled, "\n")
print("created_at : ", currentSearch.currentResult?.statuses[0].user!.created_at, "\n")
print("description : ", currentSearch.currentResult?.statuses[0].user!.description, "\n")
print("favourites_count : ", currentSearch.currentResult?.statuses[0].user!.favourites_count, "\n")
print("follow_request_sent : ", currentSearch.currentResult?.statuses[0].user!.follow_request_sent, "\n")
print("followers_count : ", currentSearch.currentResult?.statuses[0].user!.followers_count, "\n")
print("friends_count : ", currentSearch.currentResult?.statuses[0].user!.friends_count, "\n")
print("geo_enabled : ", currentSearch.currentResult?.statuses[0].user!.geo_enabled, "\n")
print("has_extended_profile : ", currentSearch.currentResult?.statuses[0].user!.has_extended_profile, "\n")
print("id : ", currentSearch.currentResult?.statuses[0].user!.id, "\n")
print("is_translation_enabled : ", currentSearch.currentResult?.statuses[0].user!.is_translation_enabled, "\n")
print("is_translator : ", currentSearch.currentResult?.statuses[0].user!.is_translator, "\n")
print("lang : ", currentSearch.currentResult?.statuses[0].user!.lang, "\n")
print("listed_count : ", currentSearch.currentResult?.statuses[0].user!.listed_count, "\n")
print("location : ", currentSearch.currentResult?.statuses[0].user!.location, "\n")
print("name : ", currentSearch.currentResult?.statuses[0].user!.name, "\n")
print("protected : ", currentSearch.currentResult?.statuses[0].user!.protected, "\n")
print("screen_name : ", currentSearch.currentResult?.statuses[0].user!.screen_name, "\n")
print("time_zone : ", currentSearch.currentResult?.statuses[0].user!.time_zone, "\n")
print("translator_type : ", currentSearch.currentResult?.statuses[0].user!.translator_type, "\n")
print("url : ", currentSearch.currentResult?.statuses[0].user!.url, "\n")
print("verified : ", currentSearch.currentResult?.statuses[0].user!.verified, "\n")
*/

