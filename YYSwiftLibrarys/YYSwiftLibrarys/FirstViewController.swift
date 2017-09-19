//
//  FirstViewController.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/18.
//  Copyright © 2017年 yalin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSelfHudButtonPressed(_ sender: Any) {
        
        self.showSelfViewHUD(type: HUDType.hotwheels, msg: nil, detailMsg: nil, progress: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(3)) { [unowned self] in
            
            self.hiddenHUD()
        }
    }
    
    @IBAction func hiddenSelfHudButtonPressed(_ sender: Any) {
        self.showViewHUD(type: HUDType.hotwheels, msg: nil, detailMsg: nil, progress: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(3)) { [unowned self] in
            
            self.hiddenHUD()
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 10_000_000)) { [unowned self] in
            self.hiddenHUD()
        }
    }

}

