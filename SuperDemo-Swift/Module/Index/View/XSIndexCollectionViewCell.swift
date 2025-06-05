//
//  XSIndexCollectionViewCell.swift
//  SuperDemo-Swift
//
//  Created by macrolor on 2025/6/5.
//

import UIKit

class XSIndexCollectionViewCell: UICollectionViewCell {
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

    public var model: XSIndexModel? {
        didSet {
            iconImageView.image = UIImage(systemName: model?.icon ?? "")
            titleLabel.text = model?.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        iconImageView.layer.cornerRadius = 20
        iconImageView.clipsToBounds = true
        iconImageView.tintColor = .gray
        iconImageView.backgroundColor = .clear
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        titleLabel.textColor = .darkGray
        titleLabel.numberOfLines = 2
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(4)
            make.bottom.lessThanOrEqualToSuperview().offset(-8)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
