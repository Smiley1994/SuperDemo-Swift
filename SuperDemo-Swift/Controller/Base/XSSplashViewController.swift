//
//  XSSplashViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSSplashViewController: UIViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        openRootViewController()
        
        
//        let square = {(param : Int) -> Int in
//            return param * param
//        }
//
//        print(square(4))
        
    }

    
    func openRootViewController() {
//        UIApplication.shared.keyWindow?.rootViewController = XSChassisViewController()
        UIApplication.shared.windows.first?.rootViewController = XSChassisViewController()
    }

}
