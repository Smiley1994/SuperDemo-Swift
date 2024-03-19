//
//  XSTestListViewModel.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2024/1/13.
//

import UIKit

struct TestUser {
    var id: String
    var name: String
    var email: String
}

class XSTestListViewModel: XSListViewModel<TestUser> {

    
    override func requestData(completion: @escaping () -> Void) {
        
        
        let item0 = TestUser(id: "000", name: "AA", email: "AA@gmail.com")
        let item1 = TestUser(id: "001", name: "BB", email: "BB@gmail.com")
        let item2 = TestUser(id: "002", name: "CC", email: "CC@gmail.com")
        let item3 = TestUser(id: "003", name: "DD", email: "DD@gmail.com")
        let item4 = TestUser(id: "004", name: "EE", email: "EE@gmail.com")
        
        listArray = [item0, item1, item2, item3, item4]
        
    }
    
}
