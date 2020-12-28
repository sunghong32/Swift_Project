//
//  Book.swift
//  BookManager
//
//  Created by 민성홍 on 2020/12/28.
//

struct Book {
    var name:String?
    var genre:String?
    var author:String?
    
    func bookPrint() {
        print("Name: \(name!)")
        print("Genre: \(genre!)")
        print("Author: \(author!)")
    }
}


