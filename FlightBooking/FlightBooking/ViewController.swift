//
//  ViewController.swift
//  FlightBooking
//
//  Created by 민성홍 on 2021/01/05.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var departureDateButton: UIButton!
    @IBOutlet weak var returnDateLabel: UISwitch!
    @IBOutlet weak var returnDateButton: UIButton!
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    var buttonTag:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showDatePickerAction(_ sender: UIButton) {
        //print(sender.description)
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        }else{
            selectDatePicker.isHidden = false
        }
        buttonTag = sender.tag
    }
    
    @IBAction func showReturnDateAction(_ sender: UISwitch) {
        //print(sender.description)
//        if (sender as! UISwitch).isOn {
//            returnDateButton.isHidden = false
//            returnDateLabel.isHidden = false
//        }else{
//            returnDateButton.isHidden = true
//            returnDateLabel.isHidden = true
//        }
        
        returnDateButton.isHidden = !sender.isOn
        returnDateLabel.isHidden = !sender.isOn
    }
    @IBAction func selectedDateAction(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        
        let dateString = formatter.string(from: sender.date)
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: UIControl.State.normal)
        }else{
            returnDateButton.setTitle(dateString, for: UIControl.State.normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        selectDatePicker.isHidden = true
    }
    
}

