//
//  ViewController.swift
//  BuildYourOwnHybridDevelopmentFramework
//
//  Created by 吕文翰 on 15/9/1.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    var wk: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let conf = WKWebViewConfiguration()
        conf.userContentController.addScriptMessageHandler(self, name: "OOXX")
        
        self.wk = WKWebView(frame: self.view.frame, configuration: conf)
        self.wk.navigationDelegate = self
        self.wk.UIDelegate = self
        self.wk.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.baidu.com/")!))
        self.view.addSubview(self.wk)
    }


}

private typealias wkNavigationDelegate = ViewController
extension wkNavigationDelegate {
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog(error.debugDescription)
    }
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog(error.debugDescription)
    }
}

private typealias wkUIDelegate = ViewController
extension wkUIDelegate {
    
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        let ac = UIAlertController(title: webView.title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { (aa) -> Void in
            completionHandler()
        }))
        self.presentViewController(ac, animated: true, completion: nil)
    }
}

private typealias wkScriptMessageHandler = ViewController
extension wkScriptMessageHandler {
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        if message.name == "OOXX" {
            if let dic = message.body as? NSDictionary,
                className = dic["className"]?.description,
                functionName = dic["functionName"]?.description {
                if let cls = NSClassFromString(NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName")!.description + "." + className) as? NSObject.Type{
                    let obj = cls.init()
                    let functionSelector = Selector(functionName)
                    if obj.respondsToSelector(functionSelector) {
                        obj.performSelector(functionSelector)
                    } else {
                        print("方法未找到！")
                    }
                } else {
                    print("类未找到！")
                }
            }
        }
    }
}

class Callme: NSObject {
    func maybe() {
        print("反射成功！")
    }
}
