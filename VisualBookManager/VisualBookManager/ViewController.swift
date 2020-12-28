//
//  ViewController.swift
//  VisualBookManager
//
//  Created by 민성홍 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {

    var myBookManager = BookManager()
    
    @IBOutlet weak var outPutTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나", genre: "전쟁소설", author: "헤밍웨이")
        let book3 = Book(name: "죄와벌", genre: "사실주의", author: "톨스토이")
        //book1.bookPrint()
        //book2.bookPrint()
        //book3.bookPrint()

        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func registerAction(_ sender: Any){
        var bookTemp = Book()
        bookTemp.name = nameTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.genre = genreTextField.text!
        
        myBookManager.registerBook(bookObject: bookTemp)
        outPutTextView.text = "\(nameTextField.text!) has been registered."
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func searchAction(_ sender: Any){
        let resultBook = myBookManager.searchBook(name: nameTextField.text!)
        if resultBook != nil {
            outPutTextView.text = resultBook
        }else{
            outPutTextView.text = "we don't have book that you search. ^^;"
        }
    }
    
    @IBAction func removeAction(_ sender: Any){
        myBookManager.removeBook(name: nameTextField.text!)
        outPutTextView.text = "\(nameTextField.text!) removed."
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func showAllBooksAction(_ sender: Any) {
        //print("showAllBooksAction")
        outPutTextView.text = myBookManager.showAllBooks()
    }


}

