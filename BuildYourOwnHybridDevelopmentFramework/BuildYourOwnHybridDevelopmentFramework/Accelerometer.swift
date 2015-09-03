//
//  Accelerometer.swift
//  BuildYourOwnHybridDevelopmentFramework
//
//  Created by 吕文翰 on 15/9/3.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import Foundation
import CoreMotion

class Accelerometer: Plugin {
    var motionManager: CMMotionManager!
    
    var isRunning = false
    
    // defaults to 10 msec
    let kAccelerometerInterval: NSTimeInterval = 10
    // g constant: -9.81 m/s^2
    let kGravitationalConstant = -9.81
    
    func getCurrentAcceleration() {
        if motionManager == nil {
            motionManager = CMMotionManager()
        }
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = self.kAccelerometerInterval / 1000
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data, error) -> Void in
                let dic = NSMutableDictionary()
                dic["x"] = data!.acceleration.x * self.kGravitationalConstant
                dic["y"] = data!.acceleration.y * self.kGravitationalConstant
                dic["z"] = data!.acceleration.z * self.kGravitationalConstant
                dic["timestamp"] = NSDate().timeIntervalSince1970
                if self.callback(dic) {
                    self.motionManager.stopAccelerometerUpdates()
                }
            })
            if !self.isRunning {
                self.isRunning = true
            }
        } else {
            self.errorCallback("accelerometer not available!")
        }
    }
}