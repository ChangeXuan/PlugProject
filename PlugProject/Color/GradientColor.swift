//
//  GradientColor.swift
//  PlugProject
//
//  Created by zero on 2018/8/15.
//  Copyright © 2018年 zero. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 创建渐变色图层
    ///
    /// - Parameters:
    ///   - toColor: 渐变色的终点颜色
    ///   - frame: 图层大小
    /// - Returns:
    func gradientColor(toColor:UIColor,frame:CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        // 设置渐变的主颜色
        gradientLayer.colors = [self.cgColor,toColor.cgColor]
        return gradientLayer
    }
    
    
    /// 二维码扫描线
    ///
    /// - Parameters:
    ///   - toColor: 起始颜色和终点颜色
    ///   - frame: 大小
    /// - Returns: 颜色图层
    func scanLine(toColor:UIColor,frame:CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        // 设置渐变的主颜色
        gradientLayer.colors = [toColor.cgColor,self.cgColor,toColor.cgColor]
        // 通过设置锚点使渐变色图层变为横向
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0)
        return gradientLayer
    }
    
    /// 使用16进制转换为RGB
    ///
    /// - Parameter rgbValue: 16进制int类型"0xffffff"
    /// - Returns:
    func hexToColor(hex: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(hex & 0xFF)) / 255.0,
                       alpha: 1.0)
        
    }
}
