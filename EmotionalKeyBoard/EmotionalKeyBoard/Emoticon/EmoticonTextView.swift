//
//  EmoticonTextView.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 16/1/2.
//  Copyright © 2016年 hetefe. All rights reserved.
//

import UIKit

class EmoticonTextView: UITextView {

    //将表情图片转换为 表情文本
    func fullText() -> String{
        
        //获取属性文本中的内容信息
        let attrText = attributedText
        //遍历属性文本的内容
        //将属性文本转换成 文本字符串 方便向服务器中发送
        var strM = String()
        attrText.enumerateAttributesInRange(NSRange(location: 0, length: attrText.length), options: []) { (dict, range, _) -> Void in
            //            print(dict)
            //            print("-----------------------")
            //            print(range)
            
            if let attachment = dict["NSAttachment"] as? EmoticonTextAttachment {
                //包含附件的属性文本 有图片
                print("有图片")
                strM += attachment.chs ?? ""
                
            }else{
                //不包含属性文本 没有图片
                print("没有图片")
                let str = (self.text as NSString).substringWithRange(range)
                strM += str
            }
        }
    
        return  strM
    }
    
    func insertEmoticon(em: Emoticon) {
        if em.isEmpty {
            print("点击空表情")
            return
        }
        if em.isDelete {
            //回删
             deleteBackward()
            return
            
        }
        if em.code != nil {
            
            //文本替换
            replaceRange(selectedTextRange!, withText: em.emojiStr ?? "")
            return
        }
        
        
        let imageText = EmoticonTextAttachment().emoticonTextToImageText(em, font: font!)
        
        //在替换属性文本之前 要记录之前选中的位置
        let range = selectedRange
        
        //将属性文本进行替换 获取当前
        let strM = NSMutableAttributedString(attributedString: attributedText)
        
        strM.replaceCharactersInRange(selectedRange, withAttributedString: imageText)
        
        
        //替换textView的属性文本
        attributedText = strM
        //替换之后 恢复光标
        selectedRange = NSMakeRange(range.location + 1 , 0)
        
    }
    

}
