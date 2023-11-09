//
//  XSExtension+UICollectionViewCell.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2023/11/9.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    ///在cell 内部获取cell的父视图（UITableView && UICollectionView
    public func superCollectionView() -> UICollectionView? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let tableView = view as? UICollectionView {
                return tableView
            }
        }
        return nil
    }
}
