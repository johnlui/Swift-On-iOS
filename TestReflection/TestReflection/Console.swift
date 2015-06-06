//
//  File.swift
//  TestReflection
//
//  Created by JohnLui on 15/6/5.
//  Copyright (c) 2015年 http://www.leqicheng.com. All rights reserved.
//

import Foundation

class Console: NSObject {
    required init(string: String) {
        NSLog(string)
    }
}

class ConsoleClass: Console {
}

class HaohaowanClass: Console {
}