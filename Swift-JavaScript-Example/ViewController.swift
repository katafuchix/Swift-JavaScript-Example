//
//  ViewController.swift
//  Swift-JavaScript-Example
//
//  Created by cano on 2023/07/13.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    //@IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let html = """
        <html>
            <head>
            <meta name ="viewport" content="width=device-width, initial-scale=1">
            </head>
            <body>
            <h1>aloha</h1>
            <button onclick="window.webkit.messageHandlers.ToApp.postMessage('ButtonClicked')">Push Me</buton>
            </body>
        </html>
        """

        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(self, name: "ToApp")
        let webView = WKWebView(frame: self.view.frame, configuration: configuration)
        webView.loadHTMLString(html, baseURL: nil)
        self.view.addSubview(webView)
        webView.center = self.view.center
    }
}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("HTML Button is Clicked")
    }
}

