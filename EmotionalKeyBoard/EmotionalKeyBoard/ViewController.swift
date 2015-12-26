//
//  ViewController.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func show(sender: AnyObject) {
        
        //获取属性文本中的内容信息
        let attrText = textView.attributedText
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
                let str = (self.textView.text as NSString).substringWithRange(range)
                strM += str
            }
        }
        print(strM)
    
    }
    @IBOutlet weak var textView: UITextView!
    // [weak self] weak表示对象被内存回收时 地址自动指向nil
    private lazy var emoticonKeyBoardView: EmoticonKeyBoardView = EmoticonKeyBoardView { [unowned self](em) -> () in
        
        self.insertEmoticon(em)
    }
    
    func insertEmoticon(em: Emoticon) {
        if em.isEmpty {
            print("点击空表情")
            return
        }
        if em.isDelete {
            //回删
            textView.deleteBackward()
            return
            
        }
        if em.code != nil {
            
            //文本替换
            textView.replaceRange(textView.selectedTextRange!, withText: em.emojiStr ?? "")
            return
        }
        
        //程序走到这里显示 是图片
//        textView.replaceRange(textView.selectedTextRange!, withText: em.emojiStr ?? "")
        
        //获取用户点击的模型中包含的图片路径 获取一张图片
        let image = UIImage(contentsOfFile: em.iamgePath ?? "")
        //将图片添加到文本附件中 附件类型
        let attachment = EmoticonTextAttachment()
        //设置附件的属性
        attachment.image = image
        let height = self.textView.font!.lineHeight
        attachment.bounds = CGRect(x: 0, y: -4, width: height, height: height)
        attachment.chs = em.chs
        
        //通过附件来实例化属性文本
        let imageText = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        //给属性文本添加文本属性 添加第一个的时候可以将文本的属性带过来 但没有设置真实的属性
        imageText.addAttribute(NSFontAttributeName, value: self.textView.font!, range: NSRange(location: 0, length: 1))
        
        //在替换属性文本之前 要记录之前选中的位置
        let range = self.textView.selectedRange
        
        //将属性文本进行替换 获取当前
        let strM = NSMutableAttributedString(attributedString: self.textView.attributedText)
        
        strM.replaceCharactersInRange(self.textView.selectedRange, withAttributedString: imageText)
        
        //替换textView的属性文本
        self.textView.attributedText = strM
        //替换之后 恢复光标
        self.textView.selectedRange = NSMakeRange(range.location + 1 , 0)
    
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

