//
//  XSIndexViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import Mixpanel

class XSIndexViewController: UIViewController {
    
    private var navigationView : XSIndexNavigationView!
    
    private var collectionView : UICollectionView!
    
    private var dataArray = [XSIndexModel]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNavigation()
        setupCollectionView()
        setupDatas()
    }
    
    private func setupNavigation() {
        navigationView = XSIndexNavigationView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: NavBarHeight))
        view.addSubview(navigationView)
    }
    
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(XSIndexCollectionViewCell.self, forCellWithReuseIdentifier: "XSIndexCollectionViewCellId")
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(15)
            make.right.equalTo(view.snp.right).inset(15)
            make.bottom.equalTo(view).inset(100)
        }
        
    }
    
    private func setupDatas() {
        
        let string = XSIndexModel(title: "复制文字", icon: "document.on.document")
        
        let media = XSIndexModel(title: "传输\n图片/视频", icon: "tv.and.mediabox")
        
        let location = XSIndexModel(title: "修改定位", icon: "location")
        
        dataArray = [string, media, location]
        
        collectionView.reloadData()
        
    }
    
    
    
}

extension XSIndexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (ScreenWidth - 20) / 4 , height: (ScreenWidth - 20) / 4 + 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XSIndexCollectionViewCellId", for: indexPath) as! XSIndexCollectionViewCell
        cell.model = dataArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        if indexPath.row == 0 {
            openCopyStringViewController()
        } else if indexPath.row == 1 {
            openXSSendMediaViewController()
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            
        }
    }
    
    private func openCopyStringViewController() {
        let vc = XSCopyStrViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func openXSSendMediaViewController() {
        let vc = XSUploadMediaViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
