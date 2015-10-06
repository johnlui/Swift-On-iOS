//
//  ViewController.swift
//  TestReflection
//
//  Created by JohnLui on 15/6/5.
//  Copyright (c) 2015年 http://www.leqicheng.com. All rights reserved.
//

import UIKit
import WebKit

struct Plugin {
    let name: String!
    let className: String!
}

class ViewController: UIViewController, WKScriptMessageHandler, NSXMLParserDelegate {
    
    var pluginItemName = ""
    var pluginsDictionary = Dictionary<String, Plugin>()
    
    var wk: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = NSBundle.mainBundle().pathForResource("plugins", ofType: "xml") {
            let url = NSURL(fileURLWithPath: path)
            if let xmlParser = NSXMLParser(contentsOfURL: url) {
                xmlParser.delegate = self
                xmlParser.parse()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let request = NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("index", ofType: "html", inDirectory: "www")!))
        
        let conf = WKWebViewConfiguration()
        conf.userContentController.addScriptMessageHandler(self, name: "callbackHandler")
        
        wk = WKWebView(frame: self.view.frame, configuration: conf)
        self.view.addSubview(wk)
        wk.loadRequest(request)
    }
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        if(message.name == "callbackHandler") {
            let array = message.body.componentsSeparatedByString("://")
            if array.count == 2 {
                if let plugin = self.pluginsDictionary[array[0]] {
                    if let cls = NSClassFromString(NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName")!.description + "." + plugin.className) as? Console.Type{
                        let obj = cls.init(string: array[1])
                    }
                } else {
                    NSLog("反射失败！类 \(array[0]) 未找到")
                }
            } else {
                NSLog("反射失败！完整数据：\(message.body)")
            }
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "item" {
            if let name = attributeDict["name"] {
                self.pluginItemName = name
            }
        } else if self.pluginItemName != "" && elementName == "param" {
            let plugin = Plugin(name: self.pluginItemName, className: attributeDict["value"])
            self.pluginsDictionary[self.pluginItemName] = plugin
        }
    }

}

