//
//  ScreenCap.swift
//  PlugProject
//
//  Created by zero on 2018/8/9.
//  Copyright © 2018年 zero. All rights reserved.
//

import UIKit
import ReplayKit

protocol ScreenCapDelegate:class {
    func presentFunc(previewViewController:RPPreviewViewController)
}

class ScreenCap {
    
    weak var delegate:ScreenCapDelegate?
    
    init() {
        print("hello screencap")
    }
    
    public func startCap() {
        if (RPScreenRecorder.shared().isAvailable && !RPScreenRecorder.shared().isRecording) {
            RPScreenRecorder.shared().startRecording { (err) in
                print("----------recording\(err as Any)")
            }
        }
    }
    
    public func stopCap() {
        RPScreenRecorder.shared().stopRecording { (previewViewController, err) in
            if ((err) != nil) {
                print("recoring err")
                return
            }
            if ((previewViewController) != nil) {
                self.delegate?.presentFunc(previewViewController:previewViewController!)
            }
        }
    }
}
