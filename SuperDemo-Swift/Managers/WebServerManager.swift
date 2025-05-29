//
//  WebServerManager.swift
//  SuperDemo-Swift
//
//  Created by macrolor on 2025/5/30.
//


import UIKit

class WebServerManager {
    
    static let shared = WebServerManager()
    
    private let webServer = GCDWebServer()
    
    var receivedText: String = ""

    func startServer() {
        // 显示页面 GET 请求
        webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self) { request in
            let html = """
            <html>
            <body>
              <h1>发送文字到 iOS</h1>
              <form method="POST" action="/submit">
                <textarea name="text" rows="10" cols="50"></textarea><br/>
                <button type="submit">发送</button>
              </form>
            </body>
            </html>
            """
            return GCDWebServerDataResponse(html: html)
        }

        // 接收 POST 请求
        webServer.addHandler(
            forMethod: "POST",
            path: "/submit",
            request: GCDWebServerURLEncodedFormRequest.self
        ) { request in
            if let formRequest = request as? GCDWebServerURLEncodedFormRequest {
                let text = formRequest.arguments["text"] ?? ""
                self.receivedText = text
                NotificationCenter.default.post(name: .didReceiveText, object: nil)
            }
            return GCDWebServerDataResponse(html: "<p>发送成功！</p>")
        }

        try? webServer.start(options: [
            GCDWebServerOption_Port: 8080,
            GCDWebServerOption_BonjourName: "iOS Text Receiver"
        ])
    }
    
}

extension Notification.Name {
    static let didReceiveText = Notification.Name("didReceiveText")
}
