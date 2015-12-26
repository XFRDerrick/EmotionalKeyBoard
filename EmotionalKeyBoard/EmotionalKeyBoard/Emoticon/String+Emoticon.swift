//
//  String+Emoticon.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/26.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import Foundation

extension String {

    func emojiStr() ->String {
        //扫描文本
        let scanner = NSScanner(string: self)
        
        var value: UInt32 = 0
        //扫描十六进制字符串
        scanner.scanHexInt(&value)
        //将十六进制的字符串转换为unicode 字符
        let code = Character(UnicodeScalar(value))
        
        return "\(code)"
    
    }
    
}