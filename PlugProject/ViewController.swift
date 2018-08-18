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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
}

extension ViewController:UIImagePickerControllerDelegate ,UINavigationControllerDelegate,PhotographDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickImg = info["UIImagePickerControllerOriginalImage"] as! UIImage
        UIImageWriteToSavedPhotosAlbum(pickImg, self, nil, nil)
        picker.dismiss(animated: true) {
            print("保存成功")
        }
    }
    
    func photographUI(picker: UIImagePickerController) {
        picker.delegate = self
        self.present(picker, animated: true) {
        }
    }
}

