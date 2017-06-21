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

    @IBAction func settingButtonAction(_ sender: Any) {
    }

    @IBAction func startButtonAction(_ sender: Any) {
    }

    @IBAction func stopButtonAction(_ sender: Any) {
    }

    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainCount = timerValue - count

        countDownLabel.text = "残り\(remainCount)秒"

        return remainCount
    }
}
