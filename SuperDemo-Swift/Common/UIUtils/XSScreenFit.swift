//
//  XSScreenFit.swift
//  XSCommon
//
//  Created by 晓松 on 2019/1/18.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit


public func fitWidth(_ width : CGFloat) -> CGFloat {
    
    return width * percentageWithScreenWidth()
}

public func fitHeight(_ height : CGFloat) -> CGFloat {
    return height * percentageWithScreenHeight()
}


public func fitLandscapeFont(_ size : CGFloat) -> CGFloat {
    
    return size * percentageWithScreenWidth()
}

//public func fitVerticalFont(_ size : CGFloat) -> CGFloat {
//
//    return size * percentageWithScreenWidth()
//}

/*
 * 以6S 7 8 为基础 的屏幕比例
 */

//let deviceType = XSFitDevice.iphoneType()

public func percentageWithScreenWidth() -> CGFloat{
    return ScreenWidth / 375;
}

public func percentageWithScreenHeight() -> CGFloat{
    return ScreenHeight / 667;
}


//public func percentageWithScreenWidth() -> CGFloat{
//
//    if  deviceType == "iPhone4" || deviceType == "iPhone4S" || deviceType == "iPhone5" || deviceType == "iPhone5S" {
//        return 0.853
//
//    } else if deviceType == "iPhone6" || deviceType == "iPhone6S" || deviceType == "iPhone7" || deviceType == "iPhone8"{
//        return 1.000
//
//    } else if deviceType == "iPhone6Plus" || deviceType == "iPhone6SPlus" || deviceType == "iPhone7Plus" || deviceType == "iPhone8Plus" || deviceType == "iPhoneXR" || deviceType == "iPhoneXSMax"{
//        return 1.104
//
//    } else if deviceType == "iPhoneX" || deviceType == "iPhoneXS" {
//        return 1.000
//
//    } else if deviceType == "iPad" {
//        return 2.048
//
//    } else {
//        return 1.0
//    }
//}

//public func percentageWithScreenHeight() -> CGFloat{
//
//    if  deviceType == "iPhone4" || deviceType == "iPhone4S" {
//        return 0.719
//
//    } else if deviceType == "iPhone5" || deviceType == "iPhone5S" {
//        return 0.851
//
//    } else if deviceType == "iPhone6" || deviceType == "iPhone6S" || deviceType == "iPhone7" || deviceType == "iPhone8"{
//        return 1.000
//
//    } else if deviceType == "iPhone6Plus" || deviceType == "iPhone6SPlus" || deviceType == "iPhone7Plus" || deviceType == "iPhone8Plus"{
//        return 1.103
//
//    } else if deviceType == "iPhoneX" || deviceType == "iPhoneXS" {
//        return 1.217
//
//    } else if deviceType == "iPhoneXR" || deviceType == "iPhoneXSMax" {
//        return 1.343
//
//    } else if deviceType == "iPad" {
//        return 1.535
//
//    } else {
//
//        return 1.0
//    }
//}

