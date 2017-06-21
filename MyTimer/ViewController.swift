//
//  ViewController.swift
//  MyTimer
//
//  Created by SuzukiShigeru on 2017/06/21.
//  Copyright © 2017年 Shigeru Suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    
    var timer : Timer?
    var count = 0
    let settingKey = "timer_value"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey:10])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        count = 0
        _ = displayUpdate()
    }

    @IBAction func settingButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
        performSegue(withIdentifier: "goSetting", sender: nil)
    }

    @IBAction func startButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                return
            }
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(self.timerInterrupt(_:)),
            userInfo: nil,
            repeats: true
        )
    }

    @IBAction func stopButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
    }

    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainCount = timerValue - count

        countDownLabel.text = "残り\(remainCount)秒"

        return remainCount
    }
    
    func timerInterrupt(_ timer:Timer) {
        count += 1
        if displayUpdate() <= 0 {
            count = 0
            timer.invalidate()
        }
    }
}
