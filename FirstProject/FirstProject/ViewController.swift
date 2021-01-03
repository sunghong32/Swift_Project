//
//  ViewController.swift
//  FirstProject
//
//  Created by 민성홍 on 2020/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func touchUpSunghong(_ sender: Any) {
        count = count + 1
        label.text = "\(count)"
        
    }
}

