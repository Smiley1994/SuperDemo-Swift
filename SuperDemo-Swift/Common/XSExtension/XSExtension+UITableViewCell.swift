//
//  XSExtension+UI.swift
//  XSExtension
//
//  Created by 晓松 on 2018/5/23.
//  Copyright © 2018年 ciyuanmengdongli. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


extension UITableViewCell {
    
    ///在cell 内部获取cell的父视图（UITableView && UICollectionView）
    public func superTableView() -> UITableView? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let tableView = view as? UITableView {
                return tableView
            }
        }
        return nil
    }
}

