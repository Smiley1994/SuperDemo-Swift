//
//  XSOtherViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2019/2/20.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit
import SnapKit

class XSOtherViewController: UIViewController {

    typealias callBack = (_ str : String) -> ();
    
    var close : callBack!
    
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        
        let callBackButton = UIButton (type: .custom)
        callBackButton.backgroundColor = UIColor.red
        callBackButton.titleLabel?.text = "CallBack"
        callBackButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(callBackButton)
        callBackButton.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.view).offset(200)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
        
    }
    
    @objc func click() {
        close("ssss")
    }

}
