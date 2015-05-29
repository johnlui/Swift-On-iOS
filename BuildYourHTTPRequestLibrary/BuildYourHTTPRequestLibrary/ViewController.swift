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
        let url = "http://pitayaswift.sinaapp.com/pitaya.php"
        
        Network.post(url, callback: { (data, response, error) -> Void in
            println("POST 1 请求成功")
        })
        Network.post(url, params: ["post": "POST Network"], callback: { (data, response, error) -> Void in
            let string = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            println("POST 2 请求成功 " + string)
        })
        
        Network.get(url, callback: { (data, response, error) -> Void in
            println("GET 1 请求成功")
        })
        Network.get(url, params: ["get": "POST Network"], callback: { (data, response, error) -> Void in
            let string = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            println("GET 2 请求成功 " + string)
        })
        
        Network.request("GET", url: url, params: ["get": "Request Network"]) { (data, response, error) -> Void in
            let string = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            println("Request 请求成功 " + string)
        }
        
        let file = File(name: "file", url: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Pitaya", ofType: "png")!)!)
        Network.request("POST", url: "http://pitayaswift.sinaapp.com/pitaya.php", files: [file]) { (data, response, error) -> Void in
            let string = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            if string == "1" {
                println("上传文件成功！")
            }
        }
    }

}

