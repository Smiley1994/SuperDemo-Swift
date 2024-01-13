//
//  XSConstants.swift
//  XSCommon
//
//  Created by 晓松 on 2018/8/24.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

//当前系统版本
public let Version = (UIDevice.current.systemVersion as NSString).floatValue

public let ProjectName = Bundle.main.infoDictionary!["CFBundleDisplayName"]!


/// 屏幕宽度
public let ScreenWidth:CGFloat = UIScreen.main.bounds.size.width

/// 屏幕高度
public let ScreenHeight:CGFloat = UIScreen.main.bounds.size.height

/// 状态栏高度
public func StatusBarHeight() -> CGFloat {
    if #available(iOS 13.0, *) {
        if let statusBarManager = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.statusBarManager {
            return statusBarManager.statusBarFrame.size.height
        }
    } else {
        return UIApplication.shared.statusBarFrame.size.height
    }
    return 0
}

/// 状态栏和导航栏总高度
public let NavBarHeight: CGFloat = StatusBarHeight() + 44;
  
public let TabBarHeight: CGFloat = 83;

