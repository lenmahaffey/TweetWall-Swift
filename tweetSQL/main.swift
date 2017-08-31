//
//  main.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/12/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

print("Hello, World!")

var database: SQliteDB

do {
    try database = SQliteDB.openDB(path: "/Users/Bozziley/Desktop/testDB.db")
}
catch SQLiteError.openDatabase(message: "Unable to open database"){}

//print(database.errorMessage)




