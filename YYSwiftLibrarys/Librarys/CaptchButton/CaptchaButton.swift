//
//  CaptchButton.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/19.
//  Copyright © 2017年 yalin. All rights reserved.
//

import UIKit

protocol CaptchaButtonDelegate {
    func beginTimer(button: CaptchaButton)
    func endTimer(button: CaptchaButton)
}

class CaptchaButton: UIButton {

    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        if controlEvents == .touchUpInside {
            super.removeTarget(self, action: #selector(CaptchaButton.beginTimer), for: .touchUpInside)
            super.addTarget(self, action: #selector(CaptchaButton.beginTimer), for: UIControlEvents.touchUpInside)
        }
        super.addTarget(target, action: action, for: controlEvents)
        
    }
    
    @objc var maxTimerCount: Int = 60
    @objc var normalTitle: String = "获取验证码"
    @objc var timerFirstTitle: String = ""
    @objc var timerLastTitle: String = "秒"
    
    var delegate: CaptchaButtonDelegate?
    
    
    private var beginDate: Date?
    private var timer: Timer?
    private var isBegining: Bool = false
    
    @objc private func beginTimer() {
        beginDate = Date()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CaptchaButton.requeryCaptchaTimer), userInfo: nil, repeats: true)
        self.isEnabled = false
        
        isBegining = true
        delegate?.beginTimer(button: self)
    }
    
    @objc private func requeryCaptchaTimer() {
        if beginDate != nil {
            let count = maxTimerCount - Int(Date().timeIntervalSince(beginDate!))
            
            if count <= 0 {
                resetButton()
            }
            else {
                self.setTitle("\(timerFirstTitle)\(count)\(timerLastTitle)", for: UIControlState.normal)
            }
        }
        else {
            resetButton()
        }
    }
    
    @objc
    func resetButton() {
        beginDate = nil
        timer?.invalidate()
        timer = nil
        
        self.isEnabled = true
        self.setTitle(normalTitle, for: UIControlState.normal)
        
        if isBegining {
            delegate?.endTimer(button: self)
        }
        isBegining = false
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
