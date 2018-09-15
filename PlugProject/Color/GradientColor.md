# 使用方法
```Swift
let startColor = UIColor.white.hexToColor(hex: 0xa6a195)
let endColor = UIColor.white.hexToColor(hex: 0xc7caa8)
self.view.layer.addSublayer(startColor.gradientColor(toColor: endColor, frame: self.view.bounds))


```
## 类似二维码扫描线的用法
```Swift
let testView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 1))
let startColor = UIColor.green
let endColor = UIColor.white
testView.layer.addSublayer(startColor.scanLine(toColor: endColor, frame: testView.bounds))
self.view.addSubview(testView)
```
