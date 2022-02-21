//
//  XSUserViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import Login
import Alamofire
import SnapKit

class XSUserViewController: UIViewController {

    var loginButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        
        loginButton = UIButton(type: .custom)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.red, for: .normal)
        loginButton.addTarget(self, action: #selector(openLogin), for: .touchUpInside)
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.top.equalTo(self.view).offset(100)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
    }

    @objc
    func openLogin() {
        let login = XSLoginViewController()
        login.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(login, animated: true)
    }

}
