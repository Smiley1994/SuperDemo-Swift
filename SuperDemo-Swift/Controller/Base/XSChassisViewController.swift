//
//  XSChassisViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2019/2/11.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit

enum LeftMuneState {
    case Collapsed  //未展示
    case Expanding  //展开中
    case Expanded   //已展开
}

class XSChassisViewController: UIViewController {
    
    var rootViewController : XSRootViewController!
    
    var leftMenuViewController : XSLeftMenuViewController?
    
    var currentStatus = LeftMuneState.Collapsed {
        didSet {
            //菜单展开的时候，给主页面边缘添加阴影
            let shouldShowShadow = currentStatus != .Collapsed
            showShadowForChassisViewController(shouldShowShadow)
        }
    }
    
    let menuExpandOffSet : CGFloat = 60
    
    let menuStarOffSet : CGFloat = 80
    
    var blackCover : UIView?
    
    let minProportion : CGFloat = 1.0
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backImageView = UIImageView(image: UIImage(named: "back_mune"))
        backImageView.frame = UIScreen.main.bounds
        self.view.addSubview(backImageView)
        
        
        rootViewController = XSRootViewController()
        view.addSubview(rootViewController.view)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        rootViewController.view.addGestureRecognizer(panGestureRecognizer)
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
//        rootViewController.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handlePanGesture(_ recognizer : UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            
            let dragFromLeftToRight = (recognizer.velocity(in: view).x > 0)
            if (currentStatus == .Collapsed && dragFromLeftToRight) {
                currentStatus = .Expanding
                addLeftMenuViewController()
            }
            break
            
        case .changed:
            var centerX = recognizer.view!.centerX +
                recognizer.translation(in: view).x
            //页面滑到最左侧的话就不许要继续往左移动
            if centerX < ScreenWidth/2 { centerX = ScreenWidth/2 }
            
            // 计算缩放比例
            let percent:CGFloat = (centerX - ScreenWidth/2) /
                (view.width - menuExpandOffSet)
            var proportion:CGFloat = (centerX - ScreenWidth/2) /
                (view.width - menuExpandOffSet)
            proportion = 1 - (1 - minProportion) * proportion
            
            // 执行视差特效
            blackCover?.alpha = (proportion - minProportion) / (1 - minProportion)
            
            //主页面滑到最左侧的话就不许要继续往左移动
            recognizer.view!.centerX = centerX
            recognizer.setTranslation(.zero, in: view)
            //缩放主页面
            recognizer.view!.transform = CGAffineTransform.identity
                .scaledBy(x: proportion, y: proportion)
            
            //菜单视图移动
            leftMenuViewController?.view.centerX = ScreenWidth/2 -
                menuStarOffSet * (1 - percent)
            //菜单视图缩放
            let menuProportion = (1 + minProportion) - proportion
            leftMenuViewController?.view.transform = CGAffineTransform.identity
                .scaledBy(x: menuProportion, y: menuProportion)
            
            break
            
        case .ended:
            
            //根据页面滑动是否过半，判断后面是自动展开还是收缩
            let hasMovedhanHalfway = recognizer.view!.centerX > view.width
            animationChassisView(isExpand: hasMovedhanHalfway)
                
            break
            
            
        default: break
            
        }
    }
    
    @objc func handleTapGesture() {
        //如果菜单是展开的点击主页部分则会收起
        if currentStatus == .Expanded {
            animationChassisView(isExpand: false)
        }
    }
    
    func addLeftMenuViewController() {
        if (leftMenuViewController == nil) {
            leftMenuViewController = XSLeftMenuViewController()

            leftMenuViewController!.view.centerX = view.width / 2 * (1 - (1 - minProportion) / 2) - menuStarOffSet

            leftMenuViewController!.view.transform = CGAffineTransform.identity.scaledBy(x: minProportion, y: minProportion)

            view.insertSubview(leftMenuViewController!.view, belowSubview: rootViewController.view)

            addChild(leftMenuViewController!)
            leftMenuViewController?.didMove(toParent: self)

            blackCover = UIView(frame: self.view.frame.offsetBy(dx: 0, dy: 0))
            blackCover?.backgroundColor = UIColor.black
            self.view.insertSubview(blackCover!, belowSubview: rootViewController.view)

        }
        
    }
    
    func animationChassisView(isExpand : Bool) {
        
        if isExpand {
            currentStatus = .Expanded
            let mainPosition = view.width * (1+minProportion/2)
                - menuExpandOffSet
            doTheAnimate(mainPosition: mainPosition, mainProportion: minProportion,
                         menuPosition: view.width/2, menuProportion: 1,
                         blackCoverAlpha: 0)
            
        } else {
            let menuPosition = view.width/2 * (1-(1-minProportion)/2)
                - menuStarOffSet
            doTheAnimate(mainPosition: view.width/2, mainProportion: 1,
                         menuPosition: menuPosition, menuProportion: minProportion,
                         blackCoverAlpha: 1) {
                            finished in
                            // 动画结束之后更新状态
                            self.currentStatus = .Collapsed
                            // 移除左侧视图
                            self.leftMenuViewController?.view.removeFromSuperview()
                            // 释放内存
                            self.leftMenuViewController = nil;
                            // 移除黑色遮罩层
                            self.blackCover?.removeFromSuperview()
                            // 释放内存
                            self.blackCover = nil;
            }
        }
    }
    
    //主页移动动画、黑色遮罩层动画
    func doTheAnimate(mainPosition: CGFloat, mainProportion: CGFloat,
                      menuPosition: CGFloat, menuProportion: CGFloat,
                      blackCoverAlpha: CGFloat, completion: ((Bool) -> Void)! = nil) {
        //usingSpringWithDamping：1.0表示没有弹簧震动动画
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                        self.rootViewController.view.centerX = mainPosition
                        self.blackCover?.alpha = blackCoverAlpha
                        // 缩放主页面
                        self.rootViewController.view.transform =
                            CGAffineTransform.identity.scaledBy(x: mainProportion, y: mainProportion)
                        
                        // 菜单页移动
                        self.leftMenuViewController?.view.centerX = menuPosition
                        // 菜单页缩放
                        self.leftMenuViewController?.view.transform =
                            CGAffineTransform.identity.scaledBy(x: menuProportion, y: menuProportion)
        }, completion: completion)
    }

    func showShadowForChassisViewController(_ isShow : Bool) {
        if isShow {
            rootViewController.view.layer.shadowOpacity = 0.8
        } else {
            rootViewController.view.layer.shadowOpacity = 0.0
        }
    }
    
}
