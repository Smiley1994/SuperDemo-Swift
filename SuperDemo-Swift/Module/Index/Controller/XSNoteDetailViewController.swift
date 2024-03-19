//
//  XSNoteDetailViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/9/10.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSNoteDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建一个 UIButton
        let button = UIButton(type: .system)
        button.setTitle("Click Me", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .red

        // 创建一个 UITapGestureRecognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.cancelsTouchesInView = false
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1))
//        tapGesture1.cancelsTouchesInView = false
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2))
//        tapGesture.cancelsTouchesInView = false
        
        
        // 添加 UIButton 到视图中
        view.addSubview(button)

        // 为 UIButton 添加点击事件
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(tapGesture2)
        
        view.addGestureRecognizer(tapGesture1)
    }
    
    @objc func handleTap() {
        print("Tap gesture recognized!")
    }
    
    @objc func handleTap1() {
        print("Tap gesture recognized!--1")
    }
    
    @objc func handleTap2() {
        print("Tap gesture recognized!--2")
    }

    @objc func buttonTapped() {
        print("Button tapped!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
