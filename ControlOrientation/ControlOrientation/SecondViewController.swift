//
//  SecondViewController.swift
//  ControlOrientation
//
//  Created by JohnLui on 15/7/31.
//  Copyright © 2015年 http://lvwenhan.com. All rights reserved.
//

import UIKit

enum ScreenOrientation {
    case Heng, Shu
}

class SecondViewController: UIViewController {
    
    var orientation = ScreenOrientation.Shu

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.orientation == ScreenOrientation.Heng {
            UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeLeft.rawValue, forKey: "orientation")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissSelfVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return self.orientation == ScreenOrientation.Shu ? UIInterfaceOrientationMask.Portrait : UIInterfaceOrientationMask.All
    }
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return self.orientation == ScreenOrientation.Shu ? UIInterfaceOrientation.Portrait : UIInterfaceOrientation.LandscapeLeft
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
