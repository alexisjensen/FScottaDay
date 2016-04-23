//
//  ViewController.swift
//  F Scott a Day
//
//  Created by Alexis Jensen on 2015-12-17.
//  Copyright © 2015 beep. All rights reserved.
//

import UIKit

class KVMLViewController: UIViewController {
    
    
    
    @IBAction func websiteLink(sender: AnyObject) {
        
        if let url = NSURL(string: "http://www.vonnegutlibrary.org") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    

    
}
