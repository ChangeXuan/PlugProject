# 使用方法
```Swift
let startColor = UIColor.white.hexToColor(hex: 0xa6a195)
let endColor = UIColor.white.hexToColor(hex: 0xc7caa8)
self.view.layer.addSublayer(startColor.gradientColor(toColor: endColor, frame: self.view.bounds))
```
