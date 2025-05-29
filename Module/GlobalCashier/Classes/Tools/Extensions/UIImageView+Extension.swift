//
//  UIImageView+Extension.swift
//  GlobalCashier
//
//  Created by macrolor on 2025/5/24.
//

import Foundation

extension UIImageView {
    
    
    /// 加载网络图片
    /// - Parameter urlString: 图片链接
    func gc_loadImage(with urlString: String?) {
        guard let urlString = urlString else { return }
        // 检查缓存
        if let cachedImage = GCImageCache.shared.image(forKey: urlString) {
            self.image = cachedImage
            return
        }
        // 未命中缓存，开始下载
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data),
                  error == nil else {
                return
            }
            // 缓存图片
            GCImageCache.shared.setImage(image, forKey: urlString)
            // 回主线程设置图片
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    
    /// 加载本地图片
    /// - Parameter name: 本地图片名
    func gc_image(with name: String?) {
        guard let name = name else { return }
        if let bundle = Bundle.globalCashierBundle() {
            let image = UIImage(named: name, in: bundle, compatibleWith: nil)
            self.image = image
        }
    }
    
}
