//
//  main.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation


let dbPath = Bundle.main.path(forResource: "tweetSQL", ofType:"db", inDirectory: "Resources")
print(dbPath!)
do  {
    let database = try SQliteDB.openDB(path: dbPath!)
    }
catch SQLiteError.openDatabase("Error"){}








