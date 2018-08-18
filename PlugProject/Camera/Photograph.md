# 使用摄像头进行拍照并存入相册
- 在`ViewController`中加入三个协议方法`UIImagePickerControllerDelegate ,UINavigationControllerDelegate,PhotographDelegate`
- 输入两个协议函数
```Swift
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
```
- 实例化类，并绑定协议
```Swift
let testPhotograph:Photograph = Photograph()
testPhotograph.delegate = self
```
- 调用函数来唤醒相机
```Swift
testPhotograph.awakenCamera()
```
