//
//  SecondViewController.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/18.
//  Copyright © 2017年 yalin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showWindowHudButtonPressed(_ sender: Any) {
        
        self.showViewHUD(type: HUDType.hotwheels, msg: nil, detailMsg: nil, progress: nil)
    }
    
    @IBAction func hiddenWindowHudButtonPressed(_ sender: Any) {
        self.hiddenHUD()
    }

}

