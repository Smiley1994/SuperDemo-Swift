//
//  XSAnimationCircleView.swift
//  XSCommon
//
//  Created by 晓松 on 2019/1/10.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit

public class XSAnimationCircleView: UIView {

    var backLayer : CALayer!
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI(width: frame.size.width, height: frame.size.height)
    }
    
    func createUI(width : CGFloat, height : CGFloat) {
        
        self.backLayer = CALayer()
        self.backLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.backLayer.backgroundColor = UIColor.clear.cgColor;
        self.layer .addSublayer(self.backLayer)
        
        //创建圆环
        let bezierpath = UIBezierPath(arcCenter: CGPoint(x: width / 2, y: width / 2), radius: width / 2 - 5, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = .round
        shapeLayer.lineDashPhase = 0.8
        shapeLayer.path = bezierpath.cgPath
        self.backLayer .mask = shapeLayer
        
        
        //颜色渐变
        let colors0 : [CGColor] = [UIColor.hexColor(hexString: "18cdfa").cgColor,UIColor.hexColor(hexString: "18cdfa").cgColor]
        
        let gradientLayer0 = CAGradientLayer()
        gradientLayer0.shadowPath = bezierpath.cgPath;
        gradientLayer0.frame = CGRect(x: 0, y: 0, width: width, height: width / 2)
        gradientLayer0.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer0.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer0.colors = colors0
        
        let colors1 : [CGColor] = [UIColor.white.cgColor,UIColor.hexColor(hexString: "18cdfa").cgColor]
        
        let gradientLayer1 = CAGradientLayer()
        gradientLayer1.shadowPath = bezierpath.cgPath;
        gradientLayer1.frame = CGRect(x: 0, y: 0, width: width / 2, height: width / 2)
        gradientLayer1.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer1.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer1.colors = colors1
        
        self.backLayer.addSublayer(gradientLayer0)
        self.backLayer.addSublayer(gradientLayer1)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0;
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.repeatCount = MAXFLOAT
        rotationAnimation.duration = 1;
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        self.backLayer .add(rotationAnimation, forKey: "rotationAnimation")
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//
//    transform.scale = 比例轉換
//
//    transform.scale.x = 闊的比例轉換
//
//    transform.scale.y = 高的比例轉換
//
//    transform.rotation.z = 平面圖的旋轉
//
//    opacity = 透明度
//
//    margin
//
//    zPosition
//
//    backgroundColor    背景颜色
//
//    cornerRadius    圆角
//
//    borderWidth
//
//    bounds
//
//    contents
//
//    contentsRect
//
//    cornerRadius
//
//    frame
//
//    hidden
//
//    mask
//
//    masksToBounds
//
//    opacity
//
//    position
//
//    shadowColor
//
//    shadowOffset
//
//    shadowOpacity
//
//    shadowRadius
    
}
