//
//  Crypto.swift
//  Health
//
//  Created by Yalin on 15/9/8.
//  Copyright (c) 2015年 Yalin. All rights reserved.
//

// 需要在bridging-header文件中添加 #import <CommonCrypto/CommonDigest.h>

import Foundation

extension String {
    var md5Value: String {
        
        let original_str = self.cString(using: String.Encoding.utf8)
        
        var result: [CUnsignedChar] = [CUnsignedChar](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(original_str, CC_LONG(self.data(using: String.Encoding.utf8, allowLossyConversion: false)!.count), &result)
        
        let hash = NSMutableString()
        for index in 0...15 {
            hash.appendFormat("%02x", result[index])
        }
        
        return String(hash.lowercased)
    }
    
    var urlEncodeValue: String {
        
        /*
         private static final String[][] query_convert = {
         { "%", "%25" },
         { "=", "%3D" },
         { "?", "%3F" },
         { "&", "%26" },
         { ">", "%3E" },
         { "<", "%3C" },
         { "\"", "%22" },
         { "'", "%27" },
         { ";", "%3B" },
         { ":", "%3A" },
         { "/", "%2F" },
         { "\\", "%5C" },
         { "(", "%28" },
         { ")", "%29" },
         { "[", "%5B" },
         { "]", "%5D" },
         { "{", "%7B" },
         { "}", "%7D" },
         { "#", "%23" },
         { "!", "%21" },
         { "+", "%2B" },
         { " ", "+" },
         { "$", "%24" },
         { "^", "%5E" },
         { ",", "%2C" },
         { "~", "%7E" },
         { "`", "%60" },
         { "|", "%7C" }, 
         { "＞", "%A3%BE" }, 
         { "＜", "%A3%BC" }, 
         { "\n", "%0A" }, 
         { "\r", "%0D" } };
 */
        
        if let value = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            return value.replacingOccurrences(of: "+", with: "%2B").replacingOccurrences(of: ":", with: "%3A")
        }
        return self
    }
    
    var urlDecodeValue: String {
        
        /*
         private static final String[][] from_query_convert = {
         { "%3D", "=" },
         { "%3F", "?" },
         { "%26", "&" },
         { "%3E", ">" },
         { "%3C", "<" },
         { "%22", "\"" },
         { "%27", "'" },
         { "%3B", ";" },
         { "%3A", ":" },
         { "%2F", "/" },
         { "%5C", "\\" },
         { "%28", "(" },
         { "%29", ")" },
         { "%5B", "[" },
         { "%5D", "]" },
         { "%7B", "{" },
         { "%7D", "}" },
         { "%23", "#" },
         { "%21", "!" },
         { "%24", "$" },
         { "%5E", "^" },
         { "+", " " },
         { "%2B", "+" },
         { "%2C", "," },
         { "%7E", "~" },
         { "%60", "`" }, 
         { "%7C", "|" }, 
         { "%0D", "\r" }, 
         { "%0A", "\n" }, 
         { "%25", "%" } };
 */
        
        if let value = self.removingPercentEncoding {
            return value
        }
        return self
    }
    
}
