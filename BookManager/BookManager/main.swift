//
//  main.swift
//  BookManager
//
//  Created by 민성홍 on 2020/12/28.
//

import Foundation

var book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
var book2 = Book(name: "누구를 위하여 종을 울리나", genre: "전쟁소설", author: "헤밍웨이")
var book3 = Book(name: "죄와벌", genre: "사실주의", author: "톨스토이")
//book1.bookPrint()
//book2.bookPrint()
//book3.bookPrint()

var myBookManager = BookManager()

myBookManager.registerBook(bookObject: book1)
myBookManager.registerBook(bookObject: book2)
myBookManager.registerBook(bookObject: book3)

print(myBookManager.showAllBooks())

print("number of books : \(myBookManager.countBooks())")

//var searchResult = myBookManager.searchBook(name: "햄릿")
//
//if searchResult != nil{
//    print("\(searchResult!) 를 찾았습니다.")
//}else{
//    print("찾으시는 책이 없는데요 ^^;")
//}

if let searchResult = myBookManager.searchBook(name: "햄릿") {
    print("\(searchResult)를 찾았습니다.")
}else{
    print("찾으시는 책이 없는데요 ^^;")
}

myBookManager.removeBook(name: "죄와벌")
print(myBookManager.showAllBooks())
print("number of books : \(myBookManager.countBooks())")
