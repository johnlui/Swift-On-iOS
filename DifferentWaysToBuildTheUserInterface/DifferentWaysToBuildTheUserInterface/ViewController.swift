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
        
        let button = NSBundle.mainBundle().loadNibNamed("Button", owner: self, options: nil).first as! UIButton
        button.center = self.view.center
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoSecondStoryboardButtonBeTapped(sender: AnyObject) {
        let vc = UIStoryboard(name: "Second", bundle: nil)
            .instantiateViewControllerWithIdentifier("First") 
        self.navigationController?.pushViewController(vc, animated: true)
//        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func centerButtonBeTapped(sender: AnyObject) {
        print("centerButtonBeTapped")
    }

}

