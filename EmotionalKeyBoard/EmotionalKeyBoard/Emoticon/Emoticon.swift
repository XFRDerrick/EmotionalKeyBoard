//
//  Emoticon.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class Emoticon: NSObject {
    //添加id 分组表情的文件路径id拼接图片路径
    var id : String?
    
    //用来向服务器发送表情文本的
    var chs: String?
    //图片文件名称  本地显示对应文本的图片
    var png: String?
    
    var iamgePath: String? {
    
        //mainBundle + Emoticon.bundle + id + png
        let path = NSBundle.mainBundle().bundlePath + "/Emoticons.bundle/" + "\(id ?? "")/" + "\(png ?? "")"
        return path
    }
    
    //emoji表情 对应的十六进制的字符串
    var code: String?
    //增加emoji表情的计算性属性
    var emojiStr: String? {
    
        guard let codeStr = code else{
        
        return nil
        }
        
        return codeStr.emojiStr()
    }
    //增加标记 是否是删除按钮的标记
    var isDelete = false

    //添加空表情的属性
    var isEmpty = false
    
    init(isEmpty: Bool) {
        
        self.isEmpty = isEmpty
        super.init()
    }
    
    init(isDelete: Bool){
    
        self.isDelete = isDelete
        super.init()
        
    }
    
    init(dict: [String: String]){
    
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    
    }
    
    
    //过滤无用的字段
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }

    override var description: String {
    
        let keys = ["chs", "png", "code"]
        
        return dictionaryWithValuesForKeys(keys).description
    }

}
