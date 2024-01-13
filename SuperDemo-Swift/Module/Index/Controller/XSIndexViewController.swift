//
//  XSIndexViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import Mixpanel

class XSIndexViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var navigationView : XSIndexNavigationView!
    
    var tableView : UITableView!
    
    var dataArray = [String]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        dataArray = ["ScrollCard", "NoteDetail", "TestList", "Other"]
        
        createNavigation()
        createTableView()
        
        
    }
    
    func createNavigation() {
        navigationView = XSIndexNavigationView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: NavBarHeight))
        view.addSubview(navigationView)
    }
    
    
    func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(XSIndexDefaultCell.self, forCellReuseIdentifier: "default")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(navigationView.snp.bottom)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return XSIndexDefaultCell.calculateHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "default") as! XSIndexDefaultCell
        cell = XSIndexDefaultCell(style: .default, reuseIdentifier: "default")
        cell.headerView.titleLabel.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArray[indexPath.row]
        
        if type == "ScrollCard" {
//            Mixpanel.mainInstance().track(event: "Open Card", properties: ["time":"123456",
//                                                                           "type":"click"])
            openScrollCardViewController()
        } else if type == "NoteDetail" {
            let playerViewController = XSPlayerViewController()
            playerViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(playerViewController, animated: true)
        } else if type == "Other" {
            let other = XSOtherViewController()
            other.hidesBottomBarWhenPushed = true
            other.close = { (backStr : String) -> () in
                print(backStr)
            }
            navigationController?.pushViewController(other, animated: true)
        } else if type == "TestList" {
            let testList = XSTestListViewController(viewModel: XSTestListViewModel())
            testList.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(testList, animated: true)
        }
        
    }
    
    func openScrollCardViewController() {
        let playerViewController = XSScrollCardViewController()
        playerViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(playerViewController, animated: true)
    }
    
    
    
    func isJailBroken() -> Bool {
        //判断设备上是否安装了这些程序
        let apps = ["/APPlications/Cydia.app","/APPlications/limera1n.app","/APPlications/greenpois0n.app","/APPlications/blackra1n.app","/APPlications/blacksn0w.app","/APPlications/redsn0w.app","/APPlications/Absinthe.app"]
        for app in apps {
            //通过文件管理器，判断在指定的目录下，是否在对应的应用程序。如果存在的话。就表示当前设备为越狱设备。
            if FileManager.default.fileExists(atPath: app){
                return true
            }
        }
        return false
        
    }
    
}
