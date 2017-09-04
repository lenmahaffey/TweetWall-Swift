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
    
    var errorMessage: String {
        if sqlite3_errmsg(db) != nil {
            return String(describing: sqlite3_errmsg(db)!)
        } else {
            return "No error"
        }
    }
    
    private init(database: OpaquePointer) {
        self.db = database
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    static func openDB(path: String) throws -> SQliteDB {
        var db: OpaquePointer? = nil
        
        if sqlite3_open(path, &db) == SQLITE_OK {
            return SQliteDB(database: db!)
        } else {
            defer {
                if db != nil{
                    sqlite3_close(db!)
                }
            }
        }
        if let errorMessage = String(String(describing: sqlite3_errmsg(db!))){
            throw SQLiteError.openDatabase(message: errorMessage)
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



