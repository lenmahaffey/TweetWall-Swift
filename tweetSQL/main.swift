//
//  main.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

do  {
    let database = try SQliteDB.openDB()
    }
catch SQLiteError.openDatabase("Error"){}








