//
//  XSScrollCardViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2019/1/22.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit

class XSScrollCardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView : UICollectionView!
    
    let groupCount = 1000
    var dataArray = [String]()
    var indexArray = [Int]()
    var titleLabel : UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        self.navigationItem.title = "ScrollCard"
        
        dataArray = ["0", "1", "2", "3", "4", "5","6","7","8"]
        
        for _ in 0 ..< groupCount {
            for j in 0 ..< dataArray.count {
                indexArray.append(j)
            }
        }
        
        createScrollCardView()
        
        // 定位(中间那组)
        collectionView.scrollToItem(at: NSIndexPath.init(item: groupCount / 2 * dataArray.count, section: 0) as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        
    }
    
    func createScrollCardView() {
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: NavgationBarHeight, width: ScreenWidth, height: 100))
        titleLabel.textAlignment = .center
        titleLabel.text = "当前是0"
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        self.view.addSubview(titleLabel)
        
        
        let padding = FIT_ScreenWidth(20)
        
        let layout = XSCardFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
        let itemW = (ScreenWidth - padding * 2) / 7
        layout.itemSize = CGSize(width: itemW, height: itemW)
        collectionView = UICollectionView(frame: CGRect(x: 15, y: TabBarHeight + 100, width: ScreenWidth - 30, height: 100), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(XSCardCell.self, forCellWithReuseIdentifier: "item")
        self.view.addSubview(self.collectionView)
        
        let line = UIView(frame: CGRect(x: 15, y: TabBarHeight + 200, width: ScreenWidth - 30, height: 55))
        line.backgroundColor = UIColor.white
        self.view.addSubview(line)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: ScreenWidth - 30, height: 55)
        line.layer .addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.colors = [UIColor.randomColor.cgColor, UIColor.white.cgColor]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! XSCardCell
        
        let index = indexArray[indexPath.row]
        cell.index = index
        cell.cardNameLabel.text = dataArray[index]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! XSCardCell
        print("点击第\(String(describing: cell.index))")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pointInView = view.convert(collectionView.center, to: collectionView)
        let indexPathNow = collectionView.indexPathForItem(at: pointInView)
        let index = (indexPathNow?.row ?? 0) % dataArray.count
        let curIndexStr = String(format: "滚动至%d", index)
        titleLabel.text = curIndexStr
        print(curIndexStr)
        
    }
    
    
    func FIT_ScreenWidth(_ size: CGFloat) -> CGFloat {
        return size * ScreenWidth / 375.0
    }
    


}
