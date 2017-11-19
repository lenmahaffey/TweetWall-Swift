//
//  database.swift
//  tweetSQL
//
//  Created by Len Mahaffey on 8/16/17.
//  Copyright © 2017 TLA Designs. All rights reserved.
//

import Foundation

enum SQLiteError: Error {
    case openDatabase(message: String)
    case prepareStatment(message: String)
    case step(message: String)
    case bind(message: String)
}

class SQliteDB {
    
    private let db: OpaquePointer
    
    var resultCode: Int32 {
        let resultCode = sqlite3_errcode(db)
        return resultCode
    }
    
    var resultString: String {
        let resultCString =  String.init(cString: sqlite3_errmsg(db)!)
        return resultCString
     }

    
    private init(database: OpaquePointer) {
        self.db = database
    }
    
    deinit {
        sqlite3_close(db)
    }

    static func openDB() throws -> SQliteDB {
        var db: OpaquePointer? = nil
        let dbPath = Bundle.main.path(forResource: "tweetSQL", ofType:"db", inDirectory: "Resources")
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            //print("Database Opened")
            return SQliteDB(database: db!)
        } else {
            defer {
                if db != nil{
                    sqlite3_close(db!)
                }
            }
        }
        if sqlite3_errmsg(db!) != nil {
            throw SQLiteError.openDatabase(message: String(describing: sqlite3_errmsg(db!)))
        } else {
            throw SQLiteError.openDatabase(message: "Unknown Error")
        }
    }

    func prepare(sql: String) throws -> OpaquePointer {
        var statement: OpaquePointer? = nil
        guard sqlite3_prepare(db, sql, -1, &statement, nil) == SQLITE_OK else {
            throw SQLiteError.prepareStatment(message: errorMessage)
        }
        return statement!
    }
}



