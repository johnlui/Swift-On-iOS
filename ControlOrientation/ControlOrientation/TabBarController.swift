//
//  TabBarController.swift
//  ControlOrientation
//
//  Created by JohnLui on 15/8/1.
//  Copyright © 2015年 http://lvwenhan.com. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    func tabBarControllerSupportedInterfaceOrientations(tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        return self.selectedViewController!.supportedInterfaceOrientations()
    }
    func tabBarControllerPreferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return self.selectedViewController!.preferredInterfaceOrientationForPresentation()
    }
}
