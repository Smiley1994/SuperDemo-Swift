//
//  XSRootViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSRootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createControllers()
    }

    func createControllers() {
        let indexViewController = XSIndexViewController()
        indexViewController.tabBarItem.image = UIImage(named: "tab_home_normal")
        indexViewController.tabBarItem.selectedImage = UIImage(named: "tab_home_index")?.withRenderingMode(.alwaysOriginal)
//        indexViewController.tabBarItem.title = "index"
        indexViewController.tabBarItem.tag = 0
        indexViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.randomColor], for: .selected)
        let indexNavgationViewController = UINavigationController(rootViewController: indexViewController)
        
        
        let userViewController = XSUserViewController()
        userViewController.tabBarItem.image = UIImage(named: "tab_user_normal")
        userViewController.tabBarItem.selectedImage = UIImage(named: "tab_user_selected")?.withRenderingMode(.alwaysOriginal)
        userViewController.tabBarItem.title = "user"
        userViewController.tabBarItem.tag = 1
        userViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .selected)
        let userNavgationViewController = UINavigationController(rootViewController: userViewController)
        
        
        viewControllers = [indexNavgationViewController, userNavgationViewController]
        
        self.selectedIndex = 0
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.selectedIndex = item.tag
//        if item.tag == 0 {
//            
//        } else if item.tag == 1 {
//            
//        }
    }
    
    override var selectedIndex: Int {
        didSet {
            if selectedIndex == 0 {
                tabBar.items?.first?.title = nil
                tabBar.items?.first?.imageInsets = UIEdgeInsets(top: 6.0, left: 0, bottom: -6.0, right: 0)
            } else {
                tabBar.items?.first?.title = "index"
                tabBar.items?.first?.imageInsets = UIEdgeInsets.zero
            }
        }
    }

}
