//
//  AppDelegate.swift
//  SuperDemo-Swift
//
//  Created by Macrolor on 2022/2/11.
//

import UIKit
//import ShadowBase
import Mixpanel

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        if #available(iOS 13.0, *) {
//
//        } else {
//            self.createWindow()
//        }
        self.createWindow()
        
//        self.setupMixpanel()
//        self.setupShadowBase()
                
        return true
    }
    
    func createWindow () {
        let splashViewController = XSSplashViewController()
        let navigationViewController = UINavigationController(rootViewController: splashViewController)
        window = UIWindow()
        window?.rootViewController = navigationViewController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }

    func setupMixpanel () {
        Mixpanel.initialize(token: "3be56d48928992e6c0b74605daec6087")
        
        Mixpanel.mainInstance().track(event: "Sign Up", properties: [
                "source": "Pat's affiliate site",
                "Opted out of email": true
            ])
        
        Mixpanel.mainInstance().flush()
    }
    
    func setupShadowBase () {
//        ShadowBase.initialize(appkey: "abc ....")
    }

}

