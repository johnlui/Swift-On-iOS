//
//  ViewController.swift
//  BuildYourHTTPRequestLibrary
//
//  Created by JohnLui on 15/5/19.
//  Copyright (c) 2015年 http://lvwenhan.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mainButtonBeTapped(sender: AnyObject) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "http://baidu.com")!)
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            println("just wait for 5 seconds!")
            sleep(5)
            let string = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(string)
        })
        task.resume()
    }

}

