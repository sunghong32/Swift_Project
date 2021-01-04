//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by 민성홍 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    
}

