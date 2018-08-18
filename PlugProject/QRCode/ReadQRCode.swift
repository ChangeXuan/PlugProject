//
//  ReadQRCode.swift
//  PlugProject
//
//  Created by zero on 2018/8/18.
//  Copyright © 2018年 zero. All rights reserved.
//

import Foundation
import UIKit

class ReadQRCode {
    
    /// 读取图片中的二维码
    ///
    /// - Parameter codeImg: 传入的图片
    func useImgReadCode(codeImg:UIImage) {
        let ciImg:CIImage = CIImage.init(image: codeImg)!
        let context = CIContext.init(options: nil)
        let detecotr = CIDetector.init(ofType: CIDetectorTypeQRCode, context: context, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        let features = detecotr?.features(in: ciImg)
        for item in features as! [CIQRCodeFeature] {
            print(item.messageString ?? "")
        }
    }
    
}
