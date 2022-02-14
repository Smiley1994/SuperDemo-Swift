//
//  XSDefaultCell.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/8/18.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSDefaultCell: UICollectionViewCell {
    
    var headerView : XSIndexDefaultCellHeaderView!
    var titleLabel : UILabel!
    var images : UICollectionView!
    var spacingLine : UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    func createUI() {
        
        headerView = XSIndexDefaultCellHeaderView()
        headerView.backgroundColor = UIColor.randomColor
        contentView.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contentView);
            make.height.equalTo(64);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
