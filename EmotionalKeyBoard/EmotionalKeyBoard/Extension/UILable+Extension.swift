//
//  UILable+Extension.swift
//  sina_htf
//
//  Created by 赫腾飞 on 15/12/17.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

//最顶级的一个类  没有继承自任何一个类

extension UILabel {
    
    //convenience  表示便利构造函数
    
    //margin设置初始值的时候可以在调用的时候不使用
    convenience init (title:String, color:UIColor ,fontSize:CGFloat, margin :CGFloat = 0){
    
        self.init()
        //意味着可以获得一个实例化的对象
        //Lable的属性设置
        text = title
        textColor = color
        textAlignment = .Center
        font = UIFont.systemFontOfSize(fontSize)
        numberOfLines = 0
        if margin > 0  {
        
            preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 2 * margin
            //有margin的时候显示
            textAlignment = .Left
            
        }
        
        sizeToFit()
    }

}