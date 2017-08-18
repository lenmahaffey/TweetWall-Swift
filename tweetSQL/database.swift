//
//  database.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/16/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

class SQliteDB {
    
    private let db: OpaquePointer
    
    private init(database: OpaquePointer) {
        self.db = database
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    func open(path: String) throws -> SQliteDB {
        var db: OpaquePointer? = nil
        
        if sqlite3_open(path, &db) == SQLITE_OK {
            return SQliteDB(database: db!)
        } else{
            defer {
                if db != nil{
                    sqlite3_close(db!)
                }
            }
        }
        if let errorMessage = String(String(describing: sqlite3_errmsg(db!))){

        }
    }
}



