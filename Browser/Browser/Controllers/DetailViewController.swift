//
//  DetailViewController.swift
//  Browser
//
//  Created by Dimash on 10/2/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var website: Website?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadWebsite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = website?.title
        // Do any additional setup after loading the view.
    }
    
    private func loadWebsite() {
        if let url = website?.url {
            webView.load(URLRequest(url: url))
        }
    }
    
}
