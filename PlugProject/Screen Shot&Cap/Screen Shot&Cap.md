# 主要讲述屏幕录制和屏幕截屏两个插件的使用方法
## 屏幕录制
- 在所需要的ViewController中`import ReplayKit`
- 加入两个协议`RPPreviewViewControllerDelegate,ScreenCapDelegate`
- 完成两个协议方法
```Swift
// 弹出预览界面
func presentFunc(previewViewController:RPPreviewViewController) {
    previewViewController.previewControllerDelegate = self
    self.present(previewViewController, animated: true, completion: nil)
}

// 录制完成
func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
    previewController.dismiss(animated: true, completion: nil)
}
```
- 初始化屏幕录制类`let ReplayScreen:ScreenCap = ScreenCap()`
- 绑定协议`ReplayScreen.delegate = self`
- 开始录制屏幕`ReplayScreen.startCap()`;结束录制屏幕`ReplayScreen.stopCap()`

## 屏幕截图
 - 只需一条语句`self.view.screenShot`
 - 返回的类型为`UIImage`


