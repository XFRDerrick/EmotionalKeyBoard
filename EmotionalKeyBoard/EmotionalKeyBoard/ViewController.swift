//
//  ViewController.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    private lazy var emoticonKeyBoardView: EmoticonKeyBoardView = EmoticonKeyBoardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        
        textField.inputView = emoticonKeyBoardView
     
    }
    
    func demo(){
    
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        
        v.backgroundColor = UIColor.darkGrayColor()
        
        textField.inputView = v
        
        textField.inputAccessoryView = UIButton(type: .ContactAdd)
    }

}

