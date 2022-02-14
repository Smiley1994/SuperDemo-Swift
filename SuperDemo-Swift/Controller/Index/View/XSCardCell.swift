//
//  XSCardCell.swift
//  SampleCode
//
//  Created by Good_Morning_ on 2019/1/15.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit

class XSCardCell: UICollectionViewCell {
    
    var index : Int! // 下标

    var cardNameLabel : UILabel!
    
    override  init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.red
        layer.masksToBounds = true
        layer.cornerRadius = self.width / 2
        
        cardNameLabel = UILabel(frame: self.contentView.frame)
        cardNameLabel.textAlignment = NSTextAlignment.center
        cardNameLabel.textColor = UIColor.black
        contentView.addSubview(cardNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
