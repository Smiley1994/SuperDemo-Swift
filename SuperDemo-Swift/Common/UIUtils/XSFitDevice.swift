//
//  XSFitDevice.swift
//  XSCommon
//
//  Created by 晓松 on 2019/1/9.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit

public class XSFitDevice: NSObject {

    static let IS_IPHONE : String = "IS_IPHONE"
    static let IS_IPHONEX : String = "IS_IPHONEX"
    static let IS_IPAD : String = "IS_IPAD"
    
    public class func iphoneType() ->String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
            return String(cString: ptr)
        }
        
        if platform == "iPhone3,1" { return "iPhone4"}
        if platform == "iPhone3,2" { return "iPhone4"}
        if platform == "iPhone3,3" { return "iPhone4"}
        if platform == "iPhone4,1" { return "iPhone4S"}
        if platform == "iPhone5,1" { return "iPhone5"}
        if platform == "iPhone5,2" { return "iPhone5"}
        if platform == "iPhone6,1" { return "iPhone5S"}
        if platform == "iPhone6,2" { return "iPhone5S"}
        if platform == "iPhone7,1" { return "iPhone6Plus"}
        if platform == "iPhone7,2" { return "iPhone6"}
        if platform == "iPhone8,1" { return "iPhone6S"}
        if platform == "iPhone8,2" { return "iPhone6SPlus"}
        if platform == "iPhone8,4" { return "iPhoneSE"}
        if platform == "iPhone9,1" { return "iPhone7"}
        if platform == "iPhone9,2" { return "iPhone7Plus"}
        if platform == "iPhone10,1" { return "iPhone8"}
        if platform == "iPhone10,2" { return "iPhone8Plus"}
        if platform == "iPhone10,3" { return "iPhoneX"}
        if platform == "iPhone10,4" { return "iPhone8"}
        if platform == "iPhone10,5" { return "iPhone8Plus"}
        if platform == "iPhone10,6" { return "iPhoneX"}
        if platform == "iPhone11,8" { return "iPhoneXR"}
        if platform == "iPhone11,2" { return "iPhoneXS"}
        if platform == "iPhone11,6" { return "iPhoneXSMax"}
        
        if platform == "iPad5,1" || platform == "iPad5,2" || platform == "iPad4,4" { return "iPad"}
        if platform == "iPad5,3" || platform == "iPad5,4" { return "iPadAir2"}
        if platform == "iPad6,3" || platform == "iPad6,4" { return "iPadPro9.7"}
        if platform == "iPad6,7" || platform == "iPad6,8" { return "iPadPro12.9"}
        
        
        if platform == "i386"   { return "iPhone Simulator"}
        if platform == "x86_64" { return "iPhone Simulator"}
        
        return platform
    }
    
    public class func isIPad() ->Bool {
        if iphoneType().contains("iPad"){
            return true
        } else {
            return false
        }
    }
    
    public class func isIPhoneX() ->Bool {
        if iphoneType().contains("X"){
            return true
        } else {
            return false
        }
    }
    
}
