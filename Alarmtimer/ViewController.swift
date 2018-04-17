//
//  ViewController.swift
//  Alarmtimer
//
//  Created by D7703_27 on 2018. 4. 12..
//  Copyright © 2018년 D7703_27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var currentTimeLabel: UILabel!
    var myTimer = Timer()
    var count = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
    }
    )}
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        if currentTimeLabel.text == timeLabel.text {
            let myAlert =  UIAlertController(title: "알림", message: "설정한 시간이 되었습니다.!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: {(myaction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red
            })
            
            let test = UIAlertAction(title: "중간", style: .default, handler: {(myaction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.green
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            myAlert.addAction(okAction)
            myAlert.addAction(cancelAction)
            myAlert.addAction(test)
            present(myAlert, animated: true, completion: nil)
        }
    }
    @IBAction func changeDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
    

    @IBAction func btn(_ sender: Any) {
        if count == false {
            view.backgroundColor = UIColor.white
            count = true
        }
    }
    
}

