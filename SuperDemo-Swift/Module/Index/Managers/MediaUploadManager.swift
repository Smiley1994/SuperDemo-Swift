//
//  MediaUploadManager.swift
//  SuperDemo-Swift
//
//  Created by macrolor on 2025/6/4.
//

import Foundation

import UIKit
import Photos

class MediaUploadManager {
    static let shared = MediaUploadManager()
    private let server = GCDWebServer()
    var customSaveDirectory: URL?

    func startServer() {
        // 显示上传表单页面
        server.addHandler(forMethod: "GET", path: "/upload/media", request: GCDWebServerRequest.self) { _ in
            let html = """
            <!DOCTYPE html>
            <html>
            <head><meta charset=\"utf-8\">
            <title>上传文件</title>
            <style>
              body { font-family: -apple-system, sans-serif; background: #f0f0f0; padding: 40px; }
              .card { background: white; max-width: 500px; margin: auto; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
              h1 { text-align: center; }
              input[type='file'] { width: 100%; margin-bottom: 20px; }
              button { background: #007aff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
            </style>
            </head>
            <body>
              <div class='card'>
                <h1>上传图片/视频</h1>
                <form method='POST' action='/upload/media' enctype='multipart/form-data'>
                  <input type='file' name='media' accept='image/*,video/*' required>
                  <button type='submit'>上传</button>
                </form>
              </div>
            </body>
            </html>
            """
            return GCDWebServerDataResponse(html: html)
        }

        // 接收上传文件
        server.addHandler(forMethod: "POST", path: "/upload/media", request: GCDWebServerMultiPartFormRequest.self) { request in
            guard let multipart = request as? GCDWebServerMultiPartFormRequest,
                  let file = multipart.firstFile(forControlName: "media") else {
                return GCDWebServerDataResponse(html: "<p>❌ 上传失败：文件缺失</p>")
            }
            let uniqueName = UUID().uuidString + "-" + (file.fileName ?? "file")
            let saveDirectory = self.customSaveDirectory ?? FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
            let saveURL = saveDirectory.appendingPathComponent(uniqueName)
            do {
                try FileManager.default.copyItem(atPath: file.temporaryPath, toPath: saveURL.path)
                print("✅ 文件已保存: \(saveURL.path)")
                
                let fileExtension = saveURL.pathExtension.lowercased()
                var previewHTML = ""
                if ["png", "jpg", "jpeg", "gif", "bmp", "tiff", "heic"].contains(fileExtension) {
                    previewHTML = "<img src=\"file://\(saveURL.path)\" style=\"max-width:100%; height:auto;\" alt=\"Uploaded Image\"/>"
                } else if ["mp4", "mov", "avi", "mkv", "webm"].contains(fileExtension) {
                    previewHTML = "<video controls style=\"max-width:100%; height:auto;\"><source src=\"file://\(saveURL.path)\" type=\"video/\(fileExtension)\">您的浏览器不支持视频播放。</video>"
                }
                
                let html = """
                <p>✅ 上传成功: \(file.fileName ?? "Unnamed")</p>
                \(previewHTML)
                <p><a href="/files/\(uniqueName)" download>💾 保存到电脑</a></p>
                <p><a href="/upload/media">返回上传页面</a></p>
                """
                
                // 自动保存到相册
                if ["jpg", "jpeg", "png", "heic", "heif", "gif", "tiff", "bmp"].contains(fileExtension) {
                    if let image = UIImage(contentsOfFile: saveURL.path) {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
                } else if ["mp4", "mov", "m4v", "avi", "hevc"].contains(fileExtension) {
                    PHPhotoLibrary.shared().performChanges({
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: saveURL)
                    }, completionHandler: nil)
                }

                return GCDWebServerDataResponse(html: html)
            } catch {
                return GCDWebServerDataResponse(html: "<p>❌ 保存失败：\(error.localizedDescription)</p>")
            }
        }

        server.addHandler(forMethod: "GET", pathRegex: "^/files/.*$", request: GCDWebServerRequest.self) { request in
            let fileName = (request.url.lastPathComponent as NSString).lastPathComponent
            let saveDirectory = self.customSaveDirectory ?? FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
            let fileURL = saveDirectory.appendingPathComponent(fileName)
            if FileManager.default.fileExists(atPath: fileURL.path) {
                return GCDWebServerFileResponse(file: fileURL.path, isAttachment: true)
            } else {
                return GCDWebServerDataResponse(html: "<p>❌ 文件不存在</p>")
            }
        }

        try? server.start(options: [
            GCDWebServerOption_Port: 8080,
            GCDWebServerOption_BonjourName: "Upload Server"
        ])

        if let url = server.serverURL {
            print("📡 服务运行中：\(url)")
        }
    }

    func stopServer() {
        server.stop()
        print("🛑 服务已关闭")
    }
    
    func uploadFile(data: Data, fileName: String, completion: @escaping (Bool) -> Void) {
        guard let serverURL = server.serverURL else {
            completion(false)
            return
        }

        let url = serverURL.appendingPathComponent("upload/media")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()

        // Add file data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"media\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        let mimeType = fileName.lowercased().hasSuffix(".mp4") ? "video/mp4" : "image/jpeg"
        body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        body.append(data)
        body.append("\r\n".data(using: .utf8)!)

        // Close boundary
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }

        task.resume()
    }
}

    
