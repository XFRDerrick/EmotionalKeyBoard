//
//  UIColor+Extension.swift
//  sina_htf
//
//  Created by 赫腾飞 on 15/12/19.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor{
        let r = CGFloat(random() % 256) / 255.0
        let g = CGFloat(random() % 256) / 255.0
        let b = CGFloat(random() % 256) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}