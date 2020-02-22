//
//  ViewController+ProgressBar.swift
//  Easy-Browser
//
//  Created by KARIM on 2/22/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit
import WebKit

extension ViewController {
    
    //Update the value of the progress bar using KVO technique
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    
    //url evalution if in list or not
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        let url = navigationAction.request.url
//
//        if let host = url?.host {
//            for website in websites {
//                if host.contains(website) {
//                    decisionHandler(.allow)
//                    return
//                }
//            }
//        }
//
//        decisionHandler(.cancel)
//    }
}


