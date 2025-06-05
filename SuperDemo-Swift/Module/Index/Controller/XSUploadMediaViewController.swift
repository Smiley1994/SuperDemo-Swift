//
//  XSSendMediaViewController.swift
//  SuperDemo-Swift
//
//  Created by macrolor on 2025/6/5.
//

import UIKit
import PhotosUI

class XSUploadMediaViewController: UIViewController {

    private let ipAddressLabel = UILabel()
    
    private let uploadButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "传输图片/视频"
        
        MediaUploadManager.shared.startServer()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        MediaUploadManager.shared.stopServer()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        let ip = SXDeviceInfo.wiFiAddress() ?? ""
        
        ipAddressLabel.text = "请在浏览器中输入: " + ip + "/upload/media"
        ipAddressLabel.numberOfLines = 0
        ipAddressLabel.textColor = .black
        view.addSubview(ipAddressLabel)
        ipAddressLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(15)
            make.top.equalTo(view.snp.top).offset(120)
        }
        
        
        uploadButton.setTitle("选择图片/视频并上传电脑", for: .normal)
        uploadButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
        view.addSubview(uploadButton)
        uploadButton.snp.makeConstraints { make in
            make.top.equalTo(ipAddressLabel.snp.bottom).offset(50)
            make.left.equalTo(view.snp.left).offset(15)
            make.height.equalTo(44)
        }
        
    }
    
    @objc private func uploadButtonTapped() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }


}

extension XSUploadMediaViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)

        guard let itemProvider = results.first?.itemProvider else { return }

        let supportedTypes: [UTType] = [.image, .movie]
        for type in supportedTypes {
            if itemProvider.hasItemConformingToTypeIdentifier(type.identifier) {
                itemProvider.loadFileRepresentation(forTypeIdentifier: type.identifier) { url, error in
                    guard let url = url else { return }

                    // You can implement upload logic here using MediaUploadManager
                    print("Selected file URL: \(url)")
                    
                    do {
                        let data = try Data(contentsOf: url)
                        let filename = url.lastPathComponent

                        DispatchQueue.main.async {
                            MediaUploadManager.shared.uploadFile(data: data, fileName: filename) { success in
                                DispatchQueue.main.async {
                                    let message = success ? "✅ 上传成功" : "❌ 上传失败"
                                    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }
                        }
                    } catch {
                        print("读取文件数据失败: \(error)")
                    }
                }
                break
            }
        }
    }
}

