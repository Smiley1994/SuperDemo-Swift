//
//  XSPlayerViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/7/24.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSPlayerViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        createPlayer()
    }
    
    
    func createPlayer() {
        let playerView = XSPlayerView()
        view.addSubview(playerView)
        playerView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(350)
        }
        
    }


}
