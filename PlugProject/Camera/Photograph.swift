//
//  Photograph.swift
//  PlugProject
//
//  Created by zero on 2018/8/18.
//  Copyright © 2018年 zero. All rights reserved.
//

import Foundation
import UIKit
protocol PhotographDelegate:class {
    func photographUI(picker:UIImagePickerController)
}

class Photograph {
    weak var delegate:PhotographDelegate?
    func awakenCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
//            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            self.delegate?.photographUI(picker: picker)
//            self.present(picker, animated: true, completion: {
//
//            })
        } else {
            print("no camera")
        }
    }
}
