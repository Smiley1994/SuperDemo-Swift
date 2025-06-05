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
    
    public private(set) var receivedText: String = ""

    public func startServer() {
        webServer.addHandler(
            forMethod: "GET",
            path: "/copy/string",
            request: GCDWebServerRequest.self
        ) { request in
            let html = """
            <!DOCTYPE html>
            <html>
            <head>
              <meta charset="utf-8">
              <title>发送文字到设备</title>
              <style>
                body {
                  font-family: -apple-system, BlinkMacSystemFont, sans-serif;
                  background-color: #f4f4f4;
                  display: flex;
                  justify-content: center;
                  align-items: center;
                  height: 100vh;
                  margin: 0;
                }
                .container {
                  background-color: white;
                  padding: 30px;
                  border-radius: 10px;
                  box-shadow: 0 0 10px rgba(0,0,0,0.1);
                  max-width: 600px;
                  width: 100%;
                  box-sizing: border-box;
                }
                h1 {
                  margin-top: 0;
                  font-size: 24px;
                  text-align: center;
                }
                textarea {
                  width: 100%;
                  height: 150px;
                  padding: 10px;
                  font-size: 16px;
                  margin-bottom: 20px;
                  box-sizing: border-box;
                  border: 1px solid #ccc;
                  border-radius: 5px;
                  resize: vertical;
                }
                button {
                  background-color: #007aff;
                  color: white;
                  border: none;
                  padding: 10px 20px;
                  font-size: 16px;
                  border-radius: 5px;
                  cursor: pointer;
                  display: block;
                  margin: 0 auto;
                }
                button:hover {
                  background-color: #005fcb;
                }
              </style>
            </head>
            <body>
              <div class="container">
                <h1>发送文字到设备</h1>
                <form method="POST" action="/copy/string">
                  <textarea name="text" placeholder="在此输入文字..."></textarea>
                  <button type="submit">发送</button>
                </form>
              </div>
            </body>
            </html>
            """
            return GCDWebServerDataResponse(html: html)
        }

        // 接收 POST 请求
        webServer.addHandler(
            forMethod: "POST",
            path: "/copy/string",
            request: GCDWebServerURLEncodedFormRequest.self
        ) { request in
            if let formRequest = request as? GCDWebServerURLEncodedFormRequest {
                let text = formRequest.arguments["text"] ?? ""
                self.receivedText = text
                NotificationCenter.default.post(name: .didReceiveText, object: nil)
            }
            return GCDWebServerDataResponse(html: """
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>发送成功</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .container {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      max-width: 600px;
      width: 100%;
      box-sizing: border-box;
    }
    h1 {
      margin-top: 0;
      font-size: 24px;
      text-align: center;
    }
    p {
      text-align: center;
      font-size: 18px;
      color: green;
    }
    form {
      margin-top: 20px;
    }
    textarea {
      width: 100%;
      height: 150px;
      padding: 10px;
      font-size: 16px;
      margin-bottom: 20px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 5px;
      resize: vertical;
    }
    button {
      background-color: #007aff;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      display: block;
      margin: 0 auto;
    }
    button:hover {
      background-color: #005fcb;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>发送文字到设备</h1>
    <p>✅ 已成功发送</p>
    <form method="POST" action="/copy/string">
      <textarea name="text" placeholder="在此输入文字..."></textarea>
      <button type="submit">发送</button>
    </form>
  </div>
</body>
</html>
""")
        }

        try? webServer.start(options: [
            GCDWebServerOption_Port: 8080,
            GCDWebServerOption_BonjourName: "iOS Text Receiver"
        ])
    }
    
    public func stopServer() {
        webServer.stop()
    }
    
}

extension Notification.Name {
    static let didReceiveText = Notification.Name("didReceiveText")
}
