//
//  ViewController.swift
//  EmojiFace
//
//  Created by 赫腾飞 on 15/12/26.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "0x1f603 0x1f603 0x1f603 0x1f603"
        
        print(str.emojiStr())
        
    }

    
    func demo(){
//        //将十六进制的字符串转换成 emoji表情
//        //nsscanner 可以扫描文本
//        let scanner = NSScanner(string: str)
//        var value: UInt32 = 0
//        //扫描十六进制的字符串
//        scanner.scanHexInt(&value)
//        //将十六进制的数字转换为Unicode字节
//        let code = Character(UnicodeScalar(value))
//        
//        print(code)
//        let codeStr = "\(code)"
//        print(codeStr)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

