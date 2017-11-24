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
    
    struct resultMessage {
        var code: Int32
        var string: String
        var message: String {
            return (String(code) + " :" + string)
        }
    }
    
    var currentResult: resultMessage {
        let errorCode = sqlite3_errcode(db)
        let errorString =  String.init(cString: sqlite3_errmsg(db)!)
        return resultMessage(code: errorCode, string: errorString)
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
            throw SQLiteError.openDatabase(message: "Unknown Error\n")
        }
    }

    func prepare(sql: String) throws -> OpaquePointer {
        var statement: OpaquePointer? = nil
        if sqlite3_prepare(db, sql, -1, &statement, nil) == SQLITE_OK{
            return statement!
        } else  {
            throw SQLiteError.prepareStatment(message: "Error preparing SQL statement. Check SQL text \n \(sql) \n \(self.currentResult.message)\n")
        }
    }
    
    func executeSQL(SQLStatement: OpaquePointer) throws -> resultMessage? {
        if sqlite3_step(SQLStatement) == SQLITE_DONE {
            sqlite3_finalize(SQLStatement)
            let result = self.currentResult
            return result
        } else {
            throw SQLiteError.step(message: "Error executing SQL statement.\n \(self.currentResult.message)\n")
        }
    }
    
    func insertSQL(table: String, column: String, value: String) -> resultMessage? {
        let SQLString = """
        INSERT INTO \(table) (\(column))
        VALUES (\(value))
        """
        do {
            let SQLStatement = try self.prepare(sql: SQLString)
            let SQLResult = try self.executeSQL(SQLStatement: SQLStatement)
            return SQLResult
        }
        catch SQLiteError.prepareStatment(let message) {
            print(message)
            let result = currentResult
            return result
        }
        catch SQLiteError.step(let message) {
            print(message)
            let result = currentResult
            return result
        }
        catch {
            print ("Function insertSQL: Unknown error\n \(self.currentResult.message)\n")
            let result = currentResult
            return result
        }
    }
    
    func updateSQL(table: String, column: String, value: String, id: String) -> resultMessage? {
        let SQLString = """
        UPDATE \(table)
        SET \(column) = '\(value)'
        WHERE id = \(id);
        """
        do {
            let SQLStatement = try self.prepare(sql: SQLString)
            let SQLResult = try self.executeSQL(SQLStatement: SQLStatement)
            return SQLResult
        }
        catch SQLiteError.prepareStatment(let message) {
            print(message)
            let result = currentResult
            return result
        }
        catch SQLiteError.step(let message) {
            print(message)
            let result = currentResult
            return result
        }
        catch {
            print ("Function updateSQL: Unknown error\n \(self.currentResult.message)\n")
            let result = currentResult
            return result
        }
    }
    
    func createTweetTable(tableName: String) -> resultMessage? {
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
        do {
            let SQLStatement = try self.prepare(sql: SQLString)
            let SQLResult = try self.executeSQL(SQLStatement: SQLStatement)
            return SQLResult
        }
        catch SQLiteError.prepareStatment(let message) {
            print(message)
            let result = currentResult
            return result
        }
        catch SQLiteError.step(let message) {
            print(message)
            let result = currentResult
            return result
        }
        catch {
            print ("Function createTweetTable: Unknown error\n \(self.currentResult.message)\n")
            let result = currentResult
            return result
        }
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



