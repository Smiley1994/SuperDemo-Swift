//
//  XSTestTableViewCell.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2024/1/13.
//

import UIKit

class XSTestListTableViewCell: XSListTableViewCell<TestUser> {

    var titleLabel : UILabel!
    var idLabel : UILabel!
    var emailLabel : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        createUI()
    }
    
    func createUI() {
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        contentView .addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).inset(15)
            make.top.equalTo(contentView.snp.top).offset(0)
//            make.bottom.equalTo(contentView.snp_bottomMargin).inset(15)
            make.height.equalTo(60)
        }
        
        idLabel = UILabel()
        idLabel.textColor = .black
        contentView .addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).inset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
//            make.bottom.equalTo(contentView.snp_bottomMargin).inset(15)
            make.height.equalTo(60)
        }
        
        emailLabel = UILabel()
        emailLabel.textColor = .black
        contentView .addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).inset(15)
            make.top.equalTo(idLabel.snp.bottom).offset(0)
            make.bottom.equalTo(contentView.snp_bottomMargin).inset(0)
            make.height.equalTo(60)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(with item: TestUser) {
        titleLabel.text = "姓名:" + item.name
        idLabel.text = "ID:" + item.id
        emailLabel.text = "Email:" + item.email
        
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
