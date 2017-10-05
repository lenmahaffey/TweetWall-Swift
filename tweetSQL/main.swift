//
//  main.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

var currentSearch = twitterAPI()

sleep(1)
currentSearch.getTweets(hashtag: "#Denver")
sleep(2)
print(currentSearch.currentResult!.results)





