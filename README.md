# rapid_flutter
常用的flutter组件和demo项目

0.flutter pub get
1.Get Packages
2.Flutter run

tip:flutter_module/local.properties 文件中的路径需要更改为本地的android和flutter sdk

## 图像资源文件夹assets
## 开发目录lib:
1. /animation  ##动画demo
2. /constant      ##常量
3. /screens       ##页面
4. /utils     ##工具

## release 版 安装到 手机
flutter build apk --release --no-sound-null-safety
flutter install

## 修改闪屏页
flutter pub run flutter_native_splash:create
flutter pub run flutter_native_splash:remove


## 清理
flutter clean
flutter pub remove contacts_service


## 打开IOS 模拟器，仅限mac
open -a Simulator

## ios 打包
flutter build ios --release
flutter build ipa

##ios发布
1，个人企业级开发者账号
2，在app store 注册app
3，注册bundle id，添加app名字 ，设置bundle id
4，添加app启动图标 ，设置签名账号
5，创建构建存档ipa
