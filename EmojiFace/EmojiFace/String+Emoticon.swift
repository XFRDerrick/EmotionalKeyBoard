//
//  String+Emoticon.swift
//  EmojiFace
//
//  Created by 赫腾飞 on 15/12/26.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import Foundation

extension NSString {

    func emojiStr() -> String {
        let scanner = NSScanner(string: self as String)
        var value: UInt32 = 0
        scanner.scanHexInt(&value)
        let code = Character(UnicodeScalar(value))
        return "\(code)"
        
    }
}