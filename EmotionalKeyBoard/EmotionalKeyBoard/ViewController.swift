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
    private lazy var emoticonKeyBoardView: EmoticonKeyBoardView = EmoticonKeyBoardView { [weak self](em) -> () in
        print(em)
        self!.view.backgroundColor = UIColor.redColor()
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

