//
//  Console.swift
//  BuildYourOwnHybridDevelopmentFramework
//
//  Created by 吕文翰 on 15/9/3.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation

class Console: Plugin {
    func log() {
        if let string = self.data {
            NSLog("OOXX >>> " + string)
        }
    }
}