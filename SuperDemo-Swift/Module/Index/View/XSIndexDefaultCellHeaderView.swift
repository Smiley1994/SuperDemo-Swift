//
//  XSIndexDefaultCellHeaderView.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/8/26.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSIndexDefaultCellHeaderView: UIView {

    var titleLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
