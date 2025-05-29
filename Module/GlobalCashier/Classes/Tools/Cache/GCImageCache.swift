//
//  GCImageCache.swift
//  GlobalCashier
//
//  Created by macrolor on 2025/5/24.
//

import Foundation

class GCImageCache {
    static let shared = GCImageCache()
    private init() {}

    private let cache = NSCache<NSString, UIImage>()

    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
