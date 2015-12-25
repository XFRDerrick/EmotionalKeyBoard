//
//  EmoticonKeyBoardView.swift
//  EmotionalKeyBoard
//
//  Created by 赫腾飞 on 15/12/25.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

private let toolBarHeight: CGFloat = 35

private let EmoticonCellId = "EmoticonCellId"

class EmoticonKeyBoardView: UIView {
 
    
    //获取数据
    private lazy var packages = EmoticonManager().packages
 
    @objc private func itemDidClick(item: UIBarButtonItem){
        
        let indexPath = NSIndexPath(forItem: 0, inSection: item.tag)
        //让视图滚动到section
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: true)
        
        //点击后不能再次点击的效果
        item.enabled = false
        for itemQ in toolBar.items! {
            itemQ.enabled = itemQ != item ? true : false
        }
        print(item.tag)
    }
    
    override init(frame: CGRect) {
      
        let rect = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width , height: 226)
        super.init(frame: rect)
        
        setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 设置界面
    private func setupUI(){
    
        addSubview(toolBar)
        addSubview(collectionView)
        
        //设置约束
        toolBar.snp_makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(toolBarHeight)
        }
        collectionView.snp_makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(toolBar.snp_top)
        }
    
        setToolBar()
    }
    private func setToolBar(){
    
        toolBar.tintColor = UIColor.lightGrayColor()
        var items = [UIBarButtonItem]()
        
        var index = 0
        for title in packages {
        
            let item = UIBarButtonItem(title: title.group_name_cn, style: .Plain, target: self, action: "itemDidClick:")
            item.tag = index++
            items.append(item)
            //添加弹簧
            let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            items.append(space)
        }
        
        items.removeLast()
        toolBar.items = items
//        toor
    }
    
    //MARK:- 懒加载所有子视图
    private lazy var toolBar: UIToolbar = UIToolbar()
    private lazy var collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
       //设置单元格
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let itemW = UIScreen.mainScreen().bounds.width / 7
        layout.itemSize = CGSize(width: itemW, height: itemW)
        layout.scrollDirection = .Horizontal
        //调整 sectionInset 
        let margin = (self.bounds.height - toolBarHeight - 3 * itemW) / 4
        layout.sectionInset = UIEdgeInsets(top: margin, left: 0, bottom: margin, right: 0)
        
        
        let cv = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        cv.pagingEnabled = true
        cv.backgroundColor = UIColor.whiteColor()
        
        //注册Cell
        cv.registerClass(EmoticonCell.self, forCellWithReuseIdentifier: EmoticonCellId)
        
        //实现数据源方法 - 指定
        
        cv.dataSource = self
        return cv
    
    }()
}
//MARK:- CollectionView DataSource
extension EmoticonKeyBoardView: UICollectionViewDataSource {

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return packages.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return packages[section].emoticons.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(EmoticonCellId, forIndexPath: indexPath) as! EmoticonCell
        
        cell.backgroundColor =  indexPath.item % 2 == 0 ? UIColor.darkGrayColor() : UIColor.lightGrayColor()
        
        cell.emoticon = packages[indexPath.section].emoticons[indexPath.row]
        return cell
    }
}

class EmoticonCell: UICollectionViewCell {

    
    var emoticon: Emoticon? {
        
        didSet{
        
            emoticonBtn.setImage(UIImage(contentsOfFile: (emoticon?.iamgePath)!), forState: .Normal)
            
        }
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        addSubview(emoticonBtn)
        
        emoticonBtn.frame = CGRectInset(bounds, 4, 4)
    
    }
    
    //加载所有的子视图
    private lazy var emoticonBtn: UIButton = UIButton()
    

}

