//
//  XSUserViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import Login

class XSUserViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        
    }

    
    func openLogin() {
        let login = XSLoginViewController()
        self.navigationController?.pushViewController(login, animated: true)
    }

}
