//
//  XSExtetsion+UIImage.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2023/11/9.
//

import Foundation
import UIKit
import AVFoundation

extension UIImage {
    
    /// reset image size
    public func resetSizeImage(newSize : CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize,false,UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newSizeImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return newSizeImage;
    }
    
    /// 修改图片颜色
    public func changeColor(color: UIColor, blendMode : CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
    
    /// 获取视频缩略图
    public func videoPreviewImage(videoUrl : String) -> UIImage {
        let asset = AVURLAsset(url: URL(string: videoUrl)!)
        let gen = AVAssetImageGenerator(asset: asset)
        gen.appliesPreferredTrackTransform = true
        gen.maximumSize = CGSize(width: 300, height: 300)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        var actualTime = CMTime()
        do {
            let image = try gen.copyCGImage(at: time, actualTime: &actualTime)
            let thumb = UIImage(cgImage: image)
            return thumb
        } catch {
            let placeHoldImage = UIImage(named: "占位图")
            return placeHoldImage!
        }
    }
    
    /// MARK: 截屏
    /// 获得截屏视图（无值获取当前Window）
    public func ScreenCapture(_ view : UIView? = nil, _ isSave : Bool = false) -> UIImage {
        
        let captureView = (view ?? (UIApplication.shared.windows.first))!
        
        UIGraphicsBeginImageContextWithOptions(captureView.frame.size, false, 0.0)
        
        captureView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        if isSave { UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil) }
        
        return image!
    }
}
