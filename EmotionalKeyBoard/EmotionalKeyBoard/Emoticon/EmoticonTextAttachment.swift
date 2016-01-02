//
//  EmoticonTextAttachment.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/26.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class EmoticonTextAttachment: NSTextAttachment {
    //表情文本
    var chs : String?
    //将表情文本转换成 属性文本（富文本）
    func emoticonTextToImageText(em: Emoticon, font: UIFont) -> NSAttributedString {
    
        //获取用户点击的模型中包含的图片路径 获取一张图片
        let image = UIImage(contentsOfFile: em.iamgePath ?? "")
        //将图片添加到文本附件中 附件类型
        let attachment = EmoticonTextAttachment()
        //设置附件的属性
        attachment.image = image
        let height = font.lineHeight
        attachment.bounds = CGRect(x: 0, y: -4, width: height, height: height)
        attachment.chs = em.chs
        
        //通过附件来实例化属性文本
        let imageText = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        //给属性文本添加文本属性 添加第一个的时候可以将文本的属性带过来 但没有设置真实的属性
        imageText.addAttribute(NSFontAttributeName, value: font, range: NSRange(location: 0, length: 1))
    
        return imageText
    }
    
}
