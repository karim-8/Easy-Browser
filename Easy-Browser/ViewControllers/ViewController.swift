//
//  ViewController.swift
//  Easy-Browser
//
//  Created by KARIM on 2/22/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var progressView: UIProgressView!
    var introWebsite = "www.apple.com"
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading url part
        let firstUrl:URL? = URL(string: "https://"+introWebsite)
        if let url = firstUrl {
           webView.load(URLRequest(url: url))
           webView.allowsBackForwardNavigationGestures = true
        }
        
        //Go forward & Go Back BUTTONS
        let goforward = UIBarButtonItem(barButtonSystemItem: .play, target: webView, action: #selector(webView.goForward))
        let goBack = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))

        //instantiatebar button item caled open
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self,
                                                            action: #selector(openTappedUrl))
        //Space between items in bottom bar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
       //Refresh button
        let refresher = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        //ProgressBar
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)

        //add items to the Bar Bottom
        toolbarItems = [refresher,spacer,progressButton,spacer,goforward,spacer,goBack]
        navigationController?.isToolbarHidden = false
        
        //observing to the website loading value
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        }
    }
  
    
