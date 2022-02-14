//
//  ANN9PostDevice.swift
//  CiYuanMengDongLi
//
//  Created by 晓松 on 2018/4/26.
//  Copyright © 2018年 ciyuanmengdongli. All rights reserved.
//

import UIKit
import AdSupport
import CoreTelephony

class ANN9PostDevice: NSObject {

    class func updateIDFA(action : String, adUrl : String) {
        
        let dictionaryInfo = NSMutableDictionary()
        
        setDictionaryInfo(dictionaryInfo: dictionaryInfo)
        
        if action.length > 0 {
            dictionaryInfo.setValue(action, forKey: "action")
        }
        
        if adUrl.length > 0 {
            dictionaryInfo.setValue(adUrl, forKey: "adUrl")
        }
        
        
        let url = URL(string: "")
        var request = URLRequest(url: url!)

        var jsonData = Data()
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionaryInfo, options: JSONSerialization.WritingOptions.prettyPrinted)
            jsonData = data
        } catch  {
            print(jsonData)
        }

        request.httpMethod = "POST"
        request.httpBody = jsonData

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request)
        dataTask.resume()
        
    }
    
    class func setDictionaryInfo(dictionaryInfo : NSMutableDictionary) {
        
        dictionaryInfo.setValue(getIdfa(), forKey: "idfa")
        
        let uuid = UUID().uuidString
        dictionaryInfo.setValue(uuid, forKey: "UUID")
        
//        dictionaryInfo.setValue(ProjectId, forKey: "pid")
        
        dictionaryInfo.setValue(String().date(), forKey: "deviceDate")
        
        let bundleIdentifier:String = Bundle.main.bundleIdentifier! // Bundle Identifier
        dictionaryInfo.setValue(bundleIdentifier, forKey: "bundleID")
        
        let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String //App 名称
        dictionaryInfo .setValue(appDisplayName, forKey: "appName")
        
        let bundleShortVersion:String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String// App 版本号
        dictionaryInfo.setValue(bundleShortVersion, forKey: "bundleShortVersion")
        
        let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String //Bulid 版本号
        dictionaryInfo.setValue(buildVersion, forKey: "buildVersion")
        
        let language = NSLocale.preferredLanguages.first
        dictionaryInfo.setValue(language, forKey: "language")
        
        let country = NSLocale.current.identifier
        dictionaryInfo.setValue(country, forKey: "country")
        
        let deviceName = UIDevice.current.name
        dictionaryInfo.setValue(deviceName, forKey: "deviceName")
        
        let systemName = UIDevice.current.systemName
        dictionaryInfo.setValue(systemName, forKey: "systemname")
        
        let systemVersion:String = UIDevice.current.systemVersion
        dictionaryInfo.setValue(systemVersion, forKey: "systemversion")
        
        let model = UIDevice.current.model
        dictionaryInfo.setValue(model, forKey: "model")
        
        let localizedModel = UIDevice.current.localizedModel
        dictionaryInfo.setValue(localizedModel, forKey: "localizeModel")
        
        dictionaryInfo.setValue(operatorInforation(key: 0), forKey: "mcc")
        dictionaryInfo.setValue(operatorInforation(key: 1), forKey: "mnc")
        dictionaryInfo.setValue(operatorInforation(key: 2), forKey: "carrierName")
        
//        dictionaryInfo.setValue(iphoneType(), forKey: "Platform")
        
//        dictionaryInfo.setValue(ScreenWidth, forKey: "screenWidth")
//        dictionaryInfo.setValue(ScreenHeight, forKey: "screenHeight")
        
    }
    
    class func operatorInforation(key : Int) -> String {
        let netInfo = CTTelephonyNetworkInfo()
        let carrier = netInfo.subscriberCellularProvider
        let cellularProviderName = carrier?.carrierName
        let mcc = carrier?.mobileCountryCode
        let mnc = carrier?.mobileNetworkCode
        
        var tempString = ""
        
        switch key {
        case 0:
            
            if mcc != nil {
                tempString = mcc!
            }
            
            break
            
        case 1:
            if mcc != nil {
                tempString = mnc!
            }
            break
            
        case 2:
            if mcc != nil {
                tempString = cellularProviderName!
            }
            break
            
        default: break
            
        }
        
        return tempString
    }
    
    class func getIdfa() -> String {
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        return idfa
    }
    
    
}


