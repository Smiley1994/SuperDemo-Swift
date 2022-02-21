//
//  XSPlayerView.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/7/24.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import AVKit

class XSPlayerView: UIView {

    var playerItem:AVPlayerItem!
    var avPlayer:AVPlayer!
    var playerLayer:AVPlayerLayer!
    //时间观察者
    var timeObserver: Any!
    
    let LoadedTimeRanges : String = "loadedTimeRanges"
    let Status : String = "status"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createPlayer(videoUrl: "")
    }
    
    func createPlayer(videoUrl : String) {
        // 检测连接是否存在 不存在报错
        guard let url = URL(string: videoUrl) else { fatalError("连接错误") }
        playerItem = AVPlayerItem(url: url) // 创建视频资源
        // 监听缓冲进度改变
        playerItem.addObserver(self, forKeyPath: LoadedTimeRanges, options: NSKeyValueObservingOptions.new, context: nil)
        // 监听状态改变
        playerItem.addObserver(self, forKeyPath: Status, options: NSKeyValueObservingOptions.new, context: nil)
        // 将视频资源赋值给视频播放对象
        avPlayer = AVPlayer(playerItem: playerItem)
        // 初始化视频显示layer
        playerLayer = AVPlayerLayer(player: avPlayer)
        // 设置显示模式
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.contentsScale = UIScreen.main.scale
        // 位置放在最底下
        self.layer.insertSublayer(playerLayer, at: 0)
        
        let interval = CMTime(value: 1, timescale: 1)
        
        timeObserver = avPlayer.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main) { (progressTime) in
//            self.toolView.updateCurrentTime(avPalyer: self.avPlayer, progressTime: progressTime)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let playerItem = object as? AVPlayerItem else { return }
        if keyPath == LoadedTimeRanges{
            // 缓冲进度
            
        }else if keyPath == Status{
            // 监听状态改变
            if playerItem.status == AVPlayerItem.Status.readyToPlay{
                // 只有在这个状态下才能播放
                avPlayer.play()
            }else{
                print("加载异常\n",playerItem.status,"\n",AVPlayerItem.Status.readyToPlay)
            }
        }
        
    }
    
    func playerFinish() {
        
        avPlayer.pause()
        avPlayer.currentItem?.cancelPendingSeeks()
        avPlayer.currentItem?.asset.cancelLoading()
        playerItem.removeObserver(self, forKeyPath: LoadedTimeRanges)
        playerItem.removeObserver(self, forKeyPath: Status)
        avPlayer.removeTimeObserver(timeObserver!)
        avPlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
