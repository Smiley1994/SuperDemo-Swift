//
//  XSIndexDefaultCell.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/8/26.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSIndexDefaultCell: UITableViewCell {

    var headerView : XSIndexDefaultCellHeaderView!
    var titleLabel : UILabel!
    var images : UICollectionView!
    var spacingLine : UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
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
    
    class func calculateHeight() -> CGFloat {
        return 64
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
