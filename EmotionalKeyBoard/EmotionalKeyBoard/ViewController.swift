//
//  ViewController.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    // [weak self] weak表示对象被内存回收时 地址自动指向nil
    private lazy var emoticonKeyBoardView: EmoticonKeyBoardView = EmoticonKeyBoardView { [unowned self](em) -> () in
        print(em)
        
        //获取用户点击的模型中包含的图片路径 获取一张图片 
        let image = UIImage(contentsOfFile: em.iamgePath ?? "")
        //将图片添加到文本附件中 附件类型
        let attachment = NSTextAttachment()
        //设置附件的属性 
        attachment.image = image
        
        //通过附件来实例化属性文本
        let imageText = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        
        //将属性文本进行替换 获取当前
        let strM = NSMutableAttributedString(attributedString: self.textView.attributedText)
        
        strM.replaceCharactersInRange(self.textView.selectedRange, withAttributedString: imageText)
        
        //替换textView的属性文本
        self.textView.attributedText = strM
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.becomeFirstResponder()
        
        textView.inputView = emoticonKeyBoardView
     
//        EmoticonManager().loadEmoticon()
        
    }
    
    deinit{
        
        print("88…………")
    }
    
    
    func demo(){
    
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        
        v.backgroundColor = UIColor.darkGrayColor()
        
        textView.inputView = v
        
        textView.inputAccessoryView = UIButton(type: .ContactAdd)
    }

}

