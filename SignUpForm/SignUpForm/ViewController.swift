//
//  ViewController.swift
//  SignUpForm
//
//  Created by 민성홍 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var blogTextField: UITextField!
    
    @IBOutlet weak var outputTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        nameTextField.delegate = self
//        emailTextField.delegate = self
          
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //print("textFieldShouldReturn")
//        nameTextField.resignFirstResponder()
//        emailTextField.resignFirstResponder()
//        passwordTextField.resignFirstResponder()
//        telTextField.resignFirstResponder()
//        blogTextField.resignFirstResponder()
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        outputTextView.text = "\(nameTextField.text!)님 가입을 축하합니다."
    }
}

