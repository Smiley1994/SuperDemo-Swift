//
//  AppDelegate.swift
//  SuperDemo-Swift
//
//  Created by Macrolor on 2022/2/11.
//

import UIKit

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



}

