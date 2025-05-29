//
//  XSOtherViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2019/2/20.
//  Copyright © 2019 GoodMorning. All rights reserved.
//

import UIKit
import SnapKit

class XSOtherViewController: UIViewController {

    private let ipAddressLabel = UILabel()
    
    private let textView = UITextView()
    
//    typealias callBack = (_ str : String) -> ();
//    var close : callBack!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.randomColor
        
        title = "Other"
        
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateText), name: .didReceiveText, object: nil)

    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        WebServerManager.shared.startServer()
        
        ipAddressLabel.text = getWiFiAddress()
        ipAddressLabel.textColor = .black
        view.addSubview(ipAddressLabel)
        ipAddressLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(120)
        }
        
        textView.frame = view.bounds.insetBy(dx: 20, dy: 40)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isEditable = false
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(ipAddressLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(15)
            make.right.equalTo(view.snp.right).inset(15)
            make.height.equalTo(60)
        }
        
        let copyButton = UIButton(type: .system)
        copyButton.setTitle("复制", for: .normal)
        copyButton.addTarget(self, action: #selector(copyText), for: .touchUpInside)
        view.addSubview(copyButton)
        copyButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(50)
            make.left.equalTo(view.snp.left).offset(15)
            make.right.equalTo(view.snp.right).inset(15)
            make.height.equalTo(60)
        }
    }
    
    @objc func updateText() {
        DispatchQueue.main.async {
            self.textView.text = WebServerManager.shared.receivedText
        }
    }

    @objc func copyText() {
        UIPasteboard.general.string = textView.text
    }

    private func getWiFiAddress() -> String? {
        var address: String?

        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0, let firstAddr = ifaddr else { return nil }

        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ptr.pointee
            let addrFamily = interface.ifa_addr.pointee.sa_family

            if addrFamily == UInt8(AF_INET), let name = String(cString: interface.ifa_name, encoding: .utf8), name == "en0" {
                var addr = interface.ifa_addr.pointee
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len), &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST)
                address = String(cString: hostname)
                break
            }
        }

        freeifaddrs(ifaddr)
        return address
    }
}
