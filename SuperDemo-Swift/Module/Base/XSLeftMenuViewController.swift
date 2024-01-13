//
//  XSLeftMenuViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2019/2/11.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit
import SnapKit

class XSLeftMenuViewController: UIViewController {

    var bannerImageView : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
//        createUI()
        setupWeather()
    }
    
    func setupWeather() {
        
//        let url = "http://www.weather.com.cn/data/sk/101010100.html"
//        Alamofire.request(url).response { response in // method defaults to `.get`
//            print("response === ", JSON(response.data!))
//        }

    }
    
    func createUI() {
        bannerImageView = UIImageView()
        bannerImageView.image = UIImage(named: "background")
        self.view.addSubview(bannerImageView)
        bannerImageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.height.equalTo(150)
        }
    }

}
