//
//  XSIndexNavigationView.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/8/18.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSIndexNavigationView: UIView {

    var titleLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.randomColor
        createUI()
    }
    
    func createUI() {
        
        titleLabel = UILabel()
        titleLabel.text = "Index"
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.centerX)
            make.bottom.equalTo(self.bottom).inset(15)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
