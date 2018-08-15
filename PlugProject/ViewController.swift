//
//  ViewController.swift
//  PlugProject
//
//  Created by zero on 2018/8/9.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
    
//    let testGyro:GyroscopeClass = GyroscopeClass()
//    var testLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.testLabel = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 300, height: 100))
//        self.testLabel.text = "000000"
//        self.view.addSubview(self.testLabel)

        let test = "ffff"
        print(test.hexStringToInt())

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func screenCap(_ sender: Any) {
    }
    @IBAction func screenShot(_ sender: Any) {
    }
    @IBAction func createQRCode(_ sender: Any) {
    }
    @IBAction func motion(_ sender: Any) {
        // 使用GPS获得距离的移动
        // 使用陀螺仪判断手机的携带者是否是自己通过运动来完成距离的移动)
//        testGyro.startGyro(timeInterval: 0.5)
    }
    
    
}

