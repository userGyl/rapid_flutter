import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String singleColor = "singleColor";

class ColorView extends StatefulWidget {
  @override
  _ColorViewState createState() => _ColorViewState();
}

class _ColorViewState extends State<ColorView> {
  /// 平台通道,消息使用平台通道在客户端（UI）和宿主（平台）之间传递
  MethodChannel _channel;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      // 视图类型，作为唯一标识符
      viewType: singleColor,
      // 创建参数：将会传递给 iOS 端侧, 可以传递任意类型参数
      creationParams: "yellow",
      // 用于将creationParams编码后再发送到平台端。
      // 这里使用Flutter标准二进制编码
      creationParamsCodec: StandardMessageCodec(),
      // 原生视图创建回调
      onPlatformViewCreated: _onPlatformViewCreated,
    );
  }

  /// 原生视图创建回调操作
  /// id 是原生视图唯一标识符
  void _onPlatformViewCreated(int id) {
    // 每个 id 对应创建唯一的平台通道
    _channel = MethodChannel('singleColor_$id');
    // 设置平台通道的响应函数
    _channel.setMethodCallHandler(_handleMethod);
  }

  /// 平台通道的响应函数
  Future<void> _handleMethod(MethodCall call) async {
    /// 视图没被装载的情况不响应操作
    if (!mounted) {
      return Future.value();
    }
    switch (call.method) {
      default:
        throw UnsupportedError("Unrecognized method");
    }
  }
}