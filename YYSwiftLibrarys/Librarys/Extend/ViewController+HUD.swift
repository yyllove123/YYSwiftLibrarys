//
//  ViewController+HUD.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/18.
//  Copyright © 2017年 yalin. All rights reserved.
//

// 需要添加 pod 'MBProgressHUD' 库

import Foundation
import UIKit

enum HUDType: Int {
    case hotwheels
    case progress
    case onlyMsg
    case gif
}

var acb: Int = 1

fileprivate class ControllerHUDs {
    static let sharedInstance = ControllerHUDs()
    
    var huds: [String : MBProgressHUD] = [:]
    
    func queryHUD(id: String, controller: UIViewController?) -> MBProgressHUD {
        
        guard let hud = huds[id] else {
            
            var mbHud: MBProgressHUD? = nil
            
            if controller != nil {
                mbHud = MBProgressHUD(view: controller!.view)
            }
            else {
                mbHud = MBProgressHUD(view: UIApplication.shared.keyWindow!)
            }
            
            huds[id] = mbHud!
            return mbHud!
            
        }
        
        return hud
        
    }
    
    func removeHUD(id: String) {
        huds.removeValue(forKey: id)
    }
    
}

extension UIViewController {
    
    /// 在当前viewcontroller上面显示hud
    ///
    /// - Parameters:
    ///   - type: hud类型
    ///   - msg: 大标题
    ///   - detailMsg: 详细内容
    ///   - progress: 进度
    func showSelfViewHUD(type: HUDType, msg: String?, detailMsg: String?, progress: Float?) {
        
        let hud = queryHud(type: type, msg: msg, detailMsg: detailMsg, progress: progress, inWindow: false)
        
        self.view.addSubview(hud)
        hud.show(animated: true)
    }
    
    /// 在App Window上面显示hud
    ///
    /// - Parameters:
    ///   - type: hud类型
    ///   - msg: 大标题
    ///   - detailMsg: 详细内容
    ///   - progress: 进度
    func showViewHUD(type: HUDType, msg: String?, detailMsg: String?, progress: Float?) {
        let hud = queryHud(type: type, msg: msg, detailMsg: detailMsg, progress: progress, inWindow: true)
        
        UIApplication.shared.keyWindow!.addSubview(hud)
        hud.show(animated: true)
    }
    
    
    /// 隐藏HUD
    func hiddenHUD() {
        let hud = ControllerHUDs.sharedInstance.queryHUD(id: "\(self)", controller: self)
        hud.hide(animated: true)
        ControllerHUDs.sharedInstance.removeHUD(id: "\(self)")
    }
    
    private func queryHud(type: HUDType, msg: String?, detailMsg: String?, progress: Float?, inWindow: Bool) -> MBProgressHUD {
        
        let hud = ControllerHUDs.sharedInstance.queryHUD(id: "\(self)", controller: inWindow ? nil : self)
        
        switch type {
        case .hotwheels:
            hud.label.text = msg
            hud.detailsLabel.text = detailMsg
            hud.mode = .indeterminate
            break
        case .onlyMsg:
            hud.label.text = msg
            hud.detailsLabel.text = detailMsg
            hud.mode = .text
            break
        case .progress:
            hud.label.text = msg
            hud.detailsLabel.text = detailMsg
            hud.progress = progress == nil ? 0 : progress!
            hud.mode = .determinateHorizontalBar
            break
        case .gif:
            hud.label.text = msg
            hud.detailsLabel.text = detailMsg
            hud.mode = .customView
            break
        }
        
        return hud
    }
}
