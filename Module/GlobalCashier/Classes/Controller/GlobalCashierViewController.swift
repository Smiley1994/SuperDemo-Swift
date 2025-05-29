//
//  GlobalCashierViewController.swift
//  Alamofire
//
//  Created by macrolor on 2025/5/23.
//

import UIKit
import SDWebImage

public class GlobalCashierViewController: UIViewController {
    
    private var imageView: UIImageView!

    public override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.white
        
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        imageView.frame = CGRect(x: 100, y: 200, width: 59, height: 50)
        view.addSubview(imageView)

//        if let bundle = Bundle.globalCashierBundle() {
//            let image = UIImage(named: "WeChat", in: bundle, compatibleWith: nil)
//            imageView.image = image
//        }
        
//        imageView.gc_loadImage(with: "")
        imageView.gc_image(with: "WeChat")
        
    }
    

}
