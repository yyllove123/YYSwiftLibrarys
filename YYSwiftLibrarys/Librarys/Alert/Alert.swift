//
//  Alert.swift
//  Health
//
//  Created by Yalin on 15/8/26.
//  Copyright (c) 2015年 Yalin. All rights reserved.
//

import UIKit

struct Alert {
    static func showErrorAlert(_ title: String?, message: String?) {
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
        
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            rootController.present(alertcontroller, animated: true, completion: nil)
        }
        else {
            print("window.rootViewController is nil")
        }
    }
    
    static func showError(_ error: NSError) {
        Alert.showErrorAlert(nil, message: "\(error)")
    }
}
