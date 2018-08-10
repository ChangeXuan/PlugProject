//
//  GyroscopeClass.swift
//  PlugProject
//
//  Created by zero on 2018/8/10.
//  Copyright © 2018年 zero. All rights reserved.
//

import Foundation
import CoreMotion

class GyroscopeClass:CMMotionManager {
    
    var oldX:Double = 0
    var oldY:Double = 0
    var oldZ:Double = 0
    var restFlag:Bool = true
    var motionValue:Bool = false
    
    override init() {
        super.init()
    }
    
    /// 开始启用陀螺仪
    ///
    /// - Parameter timeInterval: 时间间隔
    public func startGyro(timeInterval:TimeInterval) {
        // 判断设备是否支持陀螺仪
        guard self.isGyroActive else {return}
        // 设置刷新间隔
        self.gyroUpdateInterval = timeInterval
        let queue = OperationQueue.current
        //开始实时获取数据
        self.startGyroUpdates(to: queue!, withHandler: { (gyroData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            // 有更新
            if self.isGyroActive {
                if let rotationRate = gyroData?.rotationRate {
                    if self.restFlag {
                        self.oldX = rotationRate.x
                        self.oldY = rotationRate.y
                        self.oldZ = rotationRate.z
                        self.restFlag = false
                    }
                    self.motionValue = self.isMotion(rotition: rotationRate)
                }
            }
        })
    }
    
    /// 判断是否运动
    ///
    /// - Parameters:
    ///   - rotition: 陀螺仪的转动数据结构题
    ///   - threshold: 阈值
    /// - Returns: 是否运动
    private func isMotion(rotition:CMRotationRate,threshold:Double = 0.5) -> Bool {
        let isX = abs(rotition.x-self.oldX) > 0.5 ? true : false
        let isY = abs(rotition.y-self.oldY) > 0.5 ? true : false
        let isZ = abs(rotition.z-self.oldZ) > 0.5 ? true : false
        if isX && isY && isZ {
            return true
        } else {
            return false
        }
    }
    
    /// 过去是否运动的信息
    public func getIsMotion() -> Bool {
        return self.motionValue
    }
    
    /// 复位
    public func restGyro() {
        self.restFlag = true
    }
}
