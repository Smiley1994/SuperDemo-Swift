//
//  XSCopyStrViewController.swift
//  SuperDemo-Swift
//
//  Created by macrolor on 2025/6/5.
//

import UIKit
import SnapKit

class XSCopyStrViewController: UIViewController {

    private let ipAddressLabel = UILabel()
    
    private let copyedLabel = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        WebServerManager.shared.stopServer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.randomColor
        
        title = "复制文字"
        
        setupUI()
        
        WebServerManager.shared.startServer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateText), name: .didReceiveText, object: nil)

    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        let ip = SXDeviceInfo.wiFiAddress() ?? ""
        
        ipAddressLabel.text = "请在浏览器中输入: " + ip + "/send/string"
        ipAddressLabel.numberOfLines = 0
        ipAddressLabel.textColor = .black
        view.addSubview(ipAddressLabel)
        ipAddressLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(15)
            make.top.equalTo(view.snp.top).offset(120)
        }
        
        copyedLabel.numberOfLines = 0
        view.addSubview(copyedLabel)
        copyedLabel.snp.makeConstraints { make in
            make.top.equalTo(ipAddressLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(15)
            make.right.equalTo(view.snp.right).inset(15)
        }
        
        let copyButton = UIButton(type: .system)
        copyButton.setTitle("复制", for: .normal)
        copyButton.setImage(UIImage(systemName: "document.on.document.fill"), for: .normal)
        copyButton.addTarget(self, action: #selector(copyText), for: .touchUpInside)
        view.addSubview(copyButton)
        copyButton.snp.makeConstraints { make in
            make.top.equalTo(copyedLabel.snp.bottom).offset(50)
            make.left.equalTo(view.snp.left).offset(15)
        }
    }
    
    @objc func updateText() {
        DispatchQueue.main.async {[weak self] in
            self?.copyedLabel.text = WebServerManager.shared.receivedText
        }
    }

    @objc func copyText() {
        UIPasteboard.general.string = copyedLabel.text
    }

}

