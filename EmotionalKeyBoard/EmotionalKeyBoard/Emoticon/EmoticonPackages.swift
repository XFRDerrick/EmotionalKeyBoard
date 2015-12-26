//
//  EmoticonPackages.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit


//分组表情的模型
class EmoticonPackages: NSObject {

    var id : String?
    
    var group_name_cn: String?
    
    lazy var emoticons =  [Emoticon]()
    
    init(id: String, group_name_cn: String, array: [[String: String]]) {
        
        super.init()
        self.id = id
        self.group_name_cn = group_name_cn
        
        //遍历获取每个表情
        //增加一个索引的标记
        var index = 0
        for item in array {
            let e = Emoticon(dict: item)
            e.id = id
            emoticons.append(e)
            index++
            if index == 20 {
                //添加一个删除表情 模型
                let deleteEmoticon = Emoticon(isDelete: true)
                emoticons.append(deleteEmoticon)
                //恢复标记
                index = 0
            }

        }
        //插入空表情
        insertEmptyEmoticon()
    }
    
    private func insertEmptyEmoticon(){
    
        let delta = emoticons.count % 21
        print(delta)
        //不需要添加空表情
        if delta == 0{
            return
        }
        //需要添加空表情
        for _ in delta..<20 {
            //添加空表情
            emoticons.append(Emoticon(isEmpty: true))
        }
        //添加一个删除表情
        emoticons.append(Emoticon(isDelete: true))
        
    }
    
   
}
