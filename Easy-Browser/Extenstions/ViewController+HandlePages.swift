//
//  ViewController+HandlePages.swift
//  Easy-Browser
//
//  Created by KARIM on 2/22/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit

extension ViewController:LinksTitleDelegates {
    func links(url: String) {
        print("i received dattttta")
        print("\(url)")
     openPage(url: url)
    }
    
    func openPage(url:String) {
        //guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://" + url) else {return}
        webView.load(URLRequest(url: url))
    }
    
    
    //generate bottom sheet with the urls
    @objc func openTappedUrl () {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "links") as! LinksViewController
        vc.linkDelegate = self
        links(url: "test")
        self.navigationController?.pushViewController(vc, animated: true)

        /*
        let ac = UIAlertController(title: "open Page", message: nil, preferredStyle: .actionSheet)
        
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))

        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
   
    */
    
    
    }
    
}
