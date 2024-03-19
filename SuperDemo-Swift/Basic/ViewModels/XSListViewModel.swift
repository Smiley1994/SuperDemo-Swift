//
//  XSBaseListViewModel.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2024/1/13.
//

import UIKit
import Alamofire

protocol XSListViewModelDelegate : AnyObject {
    func dataRequested()
}

class XSListViewModel <T>: XSBaseViewModel {

    weak var delegate: XSListViewModelDelegate?
    
    public var listArray: [T] = []
    /// 是否第一次请求
    var isFirstRequest : Bool = true
    
//    func requestData(url: String, mappingClosure: @escaping ([[String: Any]]) -> [T]) {
        
//        Alamofire.request(url).responseJSON { response in
//            switch response.result {
//            case .success(let data):
//                if let itemsData = data as? [[String: Any]] {
//                    self.listArray = mappingClosure(itemsData)
//                    self.delegate?.dataRequested()
//                }
//            case .failure(let error):
//                print("Error fetching data: \(error.localizedDescription)")
//            }
//        }
//    }
    
    func requestData(completion: @escaping () -> Void) {
        // 具体的网络请求逻辑，子类需要实现
    }
    
    func numberOfItems() -> Int {
        return listArray.count
    }

    func item(at index: Int) -> T {
        return listArray[index]
    }
    
}
