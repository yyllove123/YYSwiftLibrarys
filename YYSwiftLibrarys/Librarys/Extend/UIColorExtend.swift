//
//  UIColorExtend.swift
//  YYSwiftLibrarys
//
//  Created by gaowei on 2017/9/19.
//  Copyright © 2017年 yalin. All rights reserved.
//

import Foundation

public extension UIColor {
    
    public func toImage() -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    public static func color(hexStr: String) -> UIColor {
        
        var cString = hexStr.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            
            cString = cString.substring(from: index)
        }
        
        if (cString.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))

    }
    
    public static func color(hexNumber:Int64)->UIColor{
        
        let red = ((CGFloat)((hexNumber & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexNumber & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexNumber & 0xFF))/255.0;
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
        
    }
}
