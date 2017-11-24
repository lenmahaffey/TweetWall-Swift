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
            return SQliteDB(database: db!)
        } else {
            defer {
                if db != nil{
                    sqlite3_close(db)
                }
            }
        }
        if sqlite3_errmsg(db!) != nil {
            throw SQLiteError.openDatabase(message: String(describing: sqlite3_errmsg(db)))
        } else {
            throw SQLiteError.openDatabase(message: "Unknown Error")
        }
    }

    func prepare(sql: String) -> OpaquePointer? {
        var statement: OpaquePointer? = nil
        if sqlite3_prepare(db, sql, -1, &statement, nil) == SQLITE_OK{
            return statement
        } else  {
            print("Error preparing SQL statement. Check SQL text")
            print(sql)
            print(self.resultCode, ": ", self.resultString)
            return nil
        }
    }
    
    func executeSQL (SQLStatement: OpaquePointer) -> Bool{
        if sqlite3_step(SQLStatement) == SQLITE_DONE {
            sqlite3_finalize(SQLStatement)
            return true
        } else {
            print(self.resultCode, ": ", self.resultString)
            sqlite3_finalize(SQLStatement)
            return false
        }
    }
    
    func insertSQL(table: String, column: String, value: String) -> Bool {
        let SQLString = "INSERT INTO \(table) (\(column)) VALUES (\(value));"
        guard let SQLStatement = self.prepare(sql: SQLString) else {
            return false
        }
        if self.executeSQL(SQLStatement: SQLStatement) == true {
            return true
        } else {
            print (SQLString)
            return false
        }
    }
    
    func updateSQL(table: String, column: String, value: String, id: String) -> Bool {
        let SQLString = """
        UPDATE \(table)
        SET \(column) = '\(value)'
        WHERE id = \(id);
        """
        guard let SQLStatement = self.prepare(sql: SQLString) else {
            return false
        }
        if self.executeSQL(SQLStatement: SQLStatement) == true {
            return true
        } else {
            return false
        }
    }
    
    func createTweetTable(tableName: String) -> Bool {
        let SQLString = """
        CREATE TABLE IF NOT EXISTS \(tableName)(
        created_at TEXT,
        favorited INT,
        favorite_count INT,
        id INT PRIMARY KEY NOT NULL,
        lang TEXT,
        result_type TEXT,
        retweeted INT,
        retweet_count INT,
        source TEXT,
        text TEXT,
        truncated INT,
        user INT);
        """
        guard let statement = self.prepare(sql: SQLString) else {
            return false
        }
        guard self.executeSQL(SQLStatement: statement) == true else {
            print ("Failed to create table for \(tableName)")
            return false
        }
        return true
    }
    
    func checkTable(tableName: String) -> Bool {
        print("Checking Table")
        let statement = """
        SELECT * FROM \(tableName);
        """
        guard let SQLstatement = self.prepare(sql: statement) else {
            print("table does not exist")
            return false
        }
        if sqlite3_step(SQLstatement) == SQLITE_DONE {
            print("Table Exists")
            return true
        }
        else {
            print("table does not exist")
            return false
        }
    }

    func createTweet(hashtag: String, id: String) -> Bool{
        if self.insertSQL(table: hashtag, column: "id", value: id) == true {
            print ("Tweet created in database \n")
            return true;
        } else {
            print ("Tweet not created in database \n")
            return false;
        }
    }
    
    func updateTweet(hashtag: String, column: String, value: String, tweet: String) {
        if self.updateSQL(table: hashtag, column: column, value: value, id: tweet) == true {
            print ("Tweet updated\n")
        } else {
            print ("Tweet not updated\n")
        }
    }
}



