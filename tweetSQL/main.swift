//
//  main.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation



do {
    guard let dbPath = Bundle.main.path(forResource: "tweetSQL", ofType:"db", inDirectory: "Resources") else {
        throw SQLiteError.openDatabase(message: "Bad Path")
    }
    print(dbPath)
    let database = try SQliteDB.openDB(path: dbPath)
}
catch SQLiteError.openDatabase("Error"){}




