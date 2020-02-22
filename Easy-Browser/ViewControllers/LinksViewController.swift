//
//  LinksViewController.swift
//  Easy-Browser
//
//  Created by KARIM on 2/22/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit


class LinksViewController: UITableViewController,LinksTitleDelegates {
    func links(url: String) {
        print("what its a data here \(url)")
    }
    
    
    var linkDelegate:LinksTitleDelegates!
    var websites = ["www.hackingwithswift.com","www.google.com","www.apple.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //cell counts
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    //cell design
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "url", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    //cell click callback
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        linkDelegate.links(url: websites[indexPath.row])
        print("The row with \(websites[indexPath.row]) is clicked")
    }

}
