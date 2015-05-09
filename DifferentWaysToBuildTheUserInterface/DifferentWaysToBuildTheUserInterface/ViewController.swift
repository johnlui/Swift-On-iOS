//
//  ViewController.swift
//  DifferentWaysToBuildTheUserInterface
//
//  Created by JohnLui on 15/5/8.
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

    @IBAction func gotoSecondStoryboardButtonBeTapped(sender: AnyObject) {
        let vc = UIStoryboard(name: "Second", bundle: nil)
            .instantiateViewControllerWithIdentifier("First") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
//        self.presentViewController(vc, animated: true, completion: nil)
    }

}

