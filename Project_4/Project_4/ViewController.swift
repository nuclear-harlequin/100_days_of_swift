//
//  ViewController.swift
//  Project_4
//
//  Created by Giovanna Toni on 08/10/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    //the ViewController class extendss from UIViewController and conforms to WKNavigationDelegate protocol
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.reddit.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}

