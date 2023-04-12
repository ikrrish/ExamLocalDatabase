//
//  fmdb.swift
//  ExamLocalDatabase
//
//  Created by R86 on 12/04/23.
//

import Foundation
import Fmdb

struct model{
    var id:Int
    var name:String
}

class fmdb{
    
    static var file = FMDatabase!
    
    static func createfile(){
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My FMDB File.db")
        file = FMDatabase(url: x)
        file.open()
        print(x.path)
        createTable()
    }
    
    static func createTable(){
        let q = "Create Table if not exists Students (id integer, name text)"
        try? file.executeupdate(q, values: nil)
        print("table created")
    }
    static func addData(id:Int, name:String){
        var q = "insert into Students values : \(id), '\(name)'"
        try? file.executeupdate(q, values: [id,name])
        print("data add")
    }
    static func getData(id:Int,name:String) -> model{
        var arr = [model]
        var q = "Select * from Students"
        
        
        
    }
    static func deleteData(id:Int){
        var q = "DELETE FROM Students WHERE id = \(id)"
        try? file.executeupdate(q, values: nil)
        print("data delete")
    }
}

