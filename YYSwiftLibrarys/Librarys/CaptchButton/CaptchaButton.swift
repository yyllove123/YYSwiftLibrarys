//
//  CaptchButton.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/19.
//  Copyright © 2017年 yalin. All rights reserved.
//

import UIKit

class CaptchaButton: UIButton {

    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        if controlEvents == .touchUpInside {
            super.addTarget(self, action: #selector(CaptchaButton.beginTimer), for: UIControlEvents.touchUpInside)
        }
        super.addTarget(target, action: action, for: controlEvents)
        
    }
    
    var maxTimerCount: Int = 60
    var normalTitle: String = "获取验证码"
    var timerTitle:String = ""
    
    
    private var beginDate: Date?
    private var timer: Timer?
    
    
    @objc private func beginTimer() {
        beginDate = Date()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CaptchaButton.requeryCaptchaTimer), userInfo: nil, repeats: true)
        self.isEnabled = false
    }
    
    @objc private func requeryCaptchaTimer() {
        if beginDate != nil {
            let count = maxTimerCount - Int(Date().timeIntervalSince(beginDate!))
            
            if count <= 0 {
                resetButton()
            }
            else {
                self.setTitle("\(timerTitle)\(count)秒", for: UIControlState.normal)
            }
        }
        else {
            resetButton()
        }
    }
    
    func resetButton() {
        beginDate = nil
        timer?.invalidate()
        timer = nil
        
        self.isEnabled = true
        self.setTitle(normalTitle, for: UIControlState.normal)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
