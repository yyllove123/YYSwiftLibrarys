//
//  ConvertFloat.swift
//  Health
//
//  Created by Yalin on 15/8/30.
//  Copyright (c) 2015年 Yalin. All rights reserved.
// 523031393@qq.com

import Foundation

public extension Float {
    
    
    /// 字符串转换 默认不会五舍六入
    ///
    /// - Parameter index: 小数点后面保留几位, nil为默认, 在6以及6以下
    /// - Returns: 转换的字符串
    public func string(index: UInt?) -> String {
        
        return self.string(index: index, roundUp: false)
    }
    
    
    /// 字符串转换
    ///
    /// - Parameters:
    ///   - index: 小数点后面保留几位, nil为默认, 在6以及6以下
    ///   - roundUp: 是否五舍六入
    /// - Returns: 转换的字符串
    public func string(index: UInt?, roundUp: Bool) -> String {
        
        if index == nil {
            return String(format: "%f", self)
        }
        
        if roundUp {
            return String(format: "%.\(index!)f", self)
        }
        else {
            let valueStr = String(format: "%.20f", self)
            
            let components = valueStr.components(separatedBy: ".")
            
//             let index = String.Index(index!)
            
            let pointAfterStr = components[1]
            return components[0] + "." + components[1][..<pointAfterStr.index(pointAfterStr.startIndex, offsetBy: String.IndexDistance(index!))]

        }
    }
}
