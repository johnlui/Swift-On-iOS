//
//  NavigationController.swift
//  ControlOrientation
//
//  Created by JohnLui on 15/8/1.
//  Copyright © 2015年 http://lvwenhan.com. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return self.visibleViewController!.supportedInterfaceOrientations()
    }
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return self.visibleViewController!.preferredInterfaceOrientationForPresentation()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
