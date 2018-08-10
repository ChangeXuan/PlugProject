//
//  GPSClass.swift
//  PlugProject
//
//  Created by zero on 2018/8/10.
//  Copyright © 2018年 zero. All rights reserved.
//

import Foundation
import CoreLocation

class GPSClass:CLLocationManager,CLLocationManagerDelegate {

    // 记录老的纬度
    var oldLa:CLLocationDegrees!
    // 记录老的经度
    var oldLo:CLLocationDegrees!
    // 复位标志
    var restFlag:Bool = true
    var distance:Double = 0
    
    override init() {
        super.init()
        print("GPS init")
        // 设置定位精度
        self.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        // 设置定位信息的更新距离
        self.distanceFilter = 1
        self.delegate = self
        // 发送授权申请
        self.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled())
        {
            // 允许使用定位服务的话，开启定位服务更新
            self.startUpdatingLocation()
            print("定位开始")
        }
    }
    
    //定位改变执行，可以得到新位置、旧位置
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获取最新的坐标
        let currLocation:CLLocation = locations.last!
        let la = currLocation.coordinate.latitude
        let lo = currLocation.coordinate.longitude
        if self.restFlag {
            self.oldLa = la
            self.oldLo = lo
            self.restFlag = false
        }
        self.distance = self.calDistance(la: la, lo: lo)
        print("经度：\(currLocation.coordinate.longitude)"+"纬度：\(currLocation.coordinate.latitude)"+"速度：\(currLocation.speed)")
    }
    
    /// 获取两个经纬度之间的距离
    ///
    /// - Parameters:
    ///   - la: 当前的纬度
    ///   - lo: 当前的经度
    /// - Returns: 距离(Double)
    private func calDistance(la:CLLocationDegrees,lo:CLLocationDegrees) -> CLLocationDistance {
        let oldLocation = CLLocation.init(latitude: self.oldLa, longitude: self.oldLo)
        let curLocation = CLLocation.init(latitude: la, longitude: lo)
        let distance:CLLocationDistance = oldLocation.distance(from: curLocation)
        return distance
    }
    
    /// 获取距离，单位是米
    ///
    /// - Returns: 距离
    public func getDistance() -> Double {
        return self.distance
    }
    
    /// 复位
    public func restGPS() {
        self.restFlag = true
    }
}
