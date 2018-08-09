# 主要包含二维码相关的类

## 创建二维码
- 先创建一个imageView`let imgView = UIImageView(frame: CGRect(x:100, y:100, width:150, height:150))`
- 在讲生成的二维码赋给imageview的image`imgView.image = CreateQRCode.createQRForString(qrString: "hello world")`
- 可以生成二维码中心带图标的二维码`CreateQRCode.createQRForString(qrString: "hello world",qrImageName:"imgName")`

