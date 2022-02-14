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


let isX = XSFitDevice.isIPhoneX();

/// 导航栏高度
public let NavgationBarHeight:CGFloat = isX ? 88 : 64

/// TabBar高度
public let TabBarHeight:CGFloat = isX ? 83 : 49

/// iPhone 顶部SafeArea
public let TopSafeAreaHeight:CGFloat = isX ? 44 : 20
/// iPhone 底部SafeArea
public let BottomSafeAreaHeight:CGFloat = isX ? 34 : 0
