//
//  Bundle+Extension.swift
//  GlobalCashier
//
//  Created by macrolor on 2025/5/24.
//

import Foundation


extension Bundle {
    static func globalCashierBundle() -> Bundle? {
        if let bundleURL = Bundle.main.url(forResource: "GlobalCashierResources", withExtension: "bundle") {
            return Bundle(url: bundleURL)
        }
        return nil
    }
}
