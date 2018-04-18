//
//  ViewController.swift
//  Alarm Timer
//
//  Created by D7702_09 on 2018. 4. 18..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var realTime: UILabel!
    
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let format = DateFormatter()
        
        format.dateFormat = "hh:dd:ss"
        realTime.text = format.string(from: myDatePicker.date)
        alarmTime.text = "00:00:00"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        realTime.text = formatter.string(from: date)
        
        if realTime.text == alarmTime.text {
            view.backgroundColor = UIColor.cyan
        }
    }
    @IBAction func DatePickerValueChanged(_ sender: Any) {
        
        let myAlarmTime = myDatePicker.date
        print(myAlarmTime)
        alarmTime.text = String(describing: myAlarmTime)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alarmTime.text = formatter.string(from: myDatePicker.date)
    }
    @IBAction func btRe(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

