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
        
        textView.text = textView.fullText()
    
    }
    @IBOutlet weak var textView: EmoticonTextView!
    // [weak self] weak表示对象被内存回收时 地址自动指向nil
    private lazy var emoticonKeyBoardView: EmoticonKeyBoardView = EmoticonKeyBoardView { [unowned self](em) -> () in
        
        self.textView.insertEmoticon(em)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.becomeFirstResponder()
        
        textView.inputView = emoticonKeyBoardView
        
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

