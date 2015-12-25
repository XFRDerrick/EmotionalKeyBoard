//
//  EmoticonManager.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

//负责 从 plist  加载表情数据

class EmoticonManager: NSObject {
    
    //分组表情数组
    lazy var packages = [EmoticonPackages]()
    
    override init() {
        
        super.init()
        loadEmoticon()
        
        
    }
    
    
    func loadEmoticon(){
    
        //获取对应的bundle 文件目录 inDirectory 间接的
        let path = NSBundle.mainBundle().pathForResource("emoticons.plist", ofType: nil, inDirectory: "Emoticons.bundle")

        guard let filePath = path else {
            
            print("文件目录不存在")
            return
        }
        //加载plist文件 转换为字典 获取的是最外的info plist
        let dict = NSDictionary(contentsOfFile: filePath)!
        
        //获取字典中的数据遍历数据
        if let array = dict["packages"] as? [[String: AnyObject]] {
        
            //遍历数组 获取id
            for item in array {
                
                let id = item["id"] as! String
                //获取分组目录中的info.plist id 是文件夹名
                
                loadGroupEmoticons(id)
            }
        }
    }
    
    private func loadGroupEmoticons(id: String) {
    
        let path = NSBundle.mainBundle().pathForResource("Info.plist", ofType: nil, inDirectory: "Emoticons.bundle/\(id)")
        guard let filePath = path else{
        
            print("文件不存在")
            return
        }
        //MARK:- 加载到info.plist文件 存储的是字典
        
        let dict = NSDictionary(contentsOfFile: filePath)
        
        //获取字典中的表情数组 key =  emoticons 对应的数组
        
        //获取三个表情包名
        let group_name_cn = dict!["group_name_cn"] as! String
        //三个表情包里的表情
        let array = dict!["emoticons"] as! [[String: String]]
        //实例化packages 
        let p = EmoticonPackages(id: id, group_name_cn: group_name_cn, array: array)
        packages.append(p)
        
    }
    

}
