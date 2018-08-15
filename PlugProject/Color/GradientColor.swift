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
        //设置渐变的主颜色
        gradientLayer.colors = [self.cgColor,toColor.cgColor]
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
