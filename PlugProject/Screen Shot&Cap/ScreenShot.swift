//
//  ScreenShot.swift
//  PlugProject
//
//  Created by zero on 2018/8/9.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit

extension UIView {
    /// 屏幕截图，返回一个UIImage类型
    var screenShot:UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


    

