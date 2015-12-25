//
//  UIView+ViewController.swift
//  sina_htf
//
//  Created by 赫腾飞 on 15/12/23.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

//通过响应者链条 将视图的导航视图控制 找到

extension UIView {

    func navController() -> UINavigationController? {
    
        //获取 当前控制器的下一个响应者
        var next = nextResponder()
        //遍历响应者链条
        repeat {
        
            if let nextObj = next as? UINavigationController {
                return nextObj
            }
            //获取下一个响应者的下一个响应者
            next = next?.nextResponder()
        
        } while (next != nil)
        
        return nil
    }
}